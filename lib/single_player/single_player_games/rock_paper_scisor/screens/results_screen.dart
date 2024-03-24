import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/screens/main_screen.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/utilis/game.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/widgets/buttom.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {super.key});
  GameChoice gameChoice;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  /* Generating random choice */
  String? randomChoice() {
    Random random = Random();
    int robotChoiceIndex = random.nextInt(3);
    return Game.choices[robotChoiceIndex];
  }

  @override
  Widget build(BuildContext context) {
    String robotChoice = randomChoice()!;
    String? robotChoicePath;
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "assets/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "assets/paper_btn.png";
        break;
      case "Scisors":
        robotChoicePath = "assets/scisor_btn.png";
        break;
      default:
    }
    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = "assets/rock_btn.png";
        break;
      case "Paper":
        playerChoice = "assets/paper_btn.png";
        break;
      case "Scisors":
        playerChoice = "assets/scisor_btn.png";
        break;
      default:
    }
    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "You Win") {
      setState(() {
        Game.gameScore++;
      });
    }
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF060A47),
        iconTheme: const IconThemeData(color: Colors.white),),
      backgroundColor: const Color(0xFF060A47),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SCORE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.gameScore}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            /* Setting the Game play pad */
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                      child: gameBtn(() {}, playerChoice!, btnWidth - 20),
                    ),
                    const Text(
                      "VS",
                      style: TextStyle(color: Colors.white, fontSize: 26.0),
                    ),
                    AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(seconds: 3),
                      child: gameBtn(() {}, robotChoicePath!, btnWidth - 20),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "${GameChoice.gameRules[widget.gameChoice.type]![robotChoice]}",
              style: const TextStyle(color: Colors.white, fontSize: 36.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(24.0),
                onPressed: () {
                  Navigator.pop(context, Game.gameScore);
                },
                shape: const StadiumBorder(),
                fillColor: Colors.white,
                child: const Text(
                  "Play Again",
                  style: TextStyle(
                      color: Color(0xFF060A47),
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}