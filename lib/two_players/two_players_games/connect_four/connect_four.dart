import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_4/two_players/two_players_games/connect_four/player.dart';

class GameState extends ChangeNotifier {
  List<List<Player?>> field = [];
  Player player1 = Player(1);
  Player player2 = Player(2);
  Player? activePlayer;
  Player? winner;
  int countMoves = 0;



  GameState() {
    reset();
  }



  void reset() {
    field = List.generate(7, (index) => List.generate(6, (index) => null));
    Random random = Random();
    winner = null;
    player1 = Player(1);
    player2 = Player(2);
    activePlayer = random.nextBool() ? player1 : player2;

    countMoves = 0;
    notifyListeners();
  }

  @override
  String toString() {
    // return a string representation of the field for debugging
    return field.join('\n');
  }

  bool canMove(int column) {
    return !field[column].contains(null);
  }

  move(int column) {
    if (canMove(column) || winner != null) return;
    int row = field[column]
        .indexOf(null); //  indexWhere((element) => element.playerNumber == 0);
    field[column][row] = activePlayer;

    countMoves++;

    // Überprüfung, ob aktueller Spieler gewonnen hat
    if (checkWinningMove(column, row)) {
      winner = activePlayer;
    } else {
      if (countMoves == 42) winner = Player(3);

      activePlayer = activePlayer == player1 ? player2 : player1;
    }
  }

  int stepsInDirection(row, column, rowStep, columnStep) {
    int currentPlayerNumber = field[row][column]!.playerNumber;
    int count = 0;

    row += rowStep;
    column += columnStep;

    while (0 <= row &&
        row < 7 &&
        0 <= column &&
        column < 6 &&
        field[row][column]?.playerNumber == currentPlayerNumber) {
      count++;
      row += rowStep;
      column += columnStep;
    }

    return count;
  }

  bool checkWinningMove(int column, int row) {
    if (stepsInDirection(column, row, 0, 1) +
            stepsInDirection(column, row, 0, -1) >=
        3) return true;
    if (stepsInDirection(column, row, 1, 0) +
            stepsInDirection(column, row, -1, 0) >=
        3) return true;
    if (stepsInDirection(column, row, 1, 1) +
            stepsInDirection(column, row, -1, -1) >=
        3) return true;
    if (stepsInDirection(column, row, 1, -1) +
            stepsInDirection(column, row, -1, 1) >=
        3) return true;

    return false;
  }
}
