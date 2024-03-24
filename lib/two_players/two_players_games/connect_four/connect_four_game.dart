
import 'package:flutter/material.dart';
import 'package:project_4/two_players/two_players_games/connect_four/connect_four.dart';

class ConnectFour extends StatefulWidget {
  const ConnectFour({super.key});

  @override
  _ConnectFourState createState() => _ConnectFourState();
}

class _ConnectFourState extends State<ConnectFour> {
  GameState game = GameState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Four'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  game.reset();
                });
              }),
        ],
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  color: game.winner != null
                      ? game.winner!.color
                      : game.activePlayer!.color,
                  child: (game.winner != null
                      ? game.winner!.playerNumber != 3
                      ? Center(
                      child: Text('Player ${game.winner!.playerNumber} won'))
                      : const Center(child: Text('Game ended in tie'))
                      : Center(
                      child: Text('Turn of Player ${game.activePlayer!.playerNumber}'))),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child:
                GridView.count(
                  crossAxisCount: 7,
                  children: List.generate(42, (index) {
                    int column = index % 7;
                    int row = index ~/ 7;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: game.field.elementAt(column).reversed.elementAt(row) != null
                              ? game.field.elementAt(column).reversed.elementAt(row)!.color
                              : Colors.lightBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        ),
                        onPressed: () {
                          setState(() {
                            game.move(column);
                          });
                        }, child: const SizedBox(),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}