import 'package:flutter/material.dart';
import 'package:project_4/two_players/two_players_games/connect_four/connect_four_game.dart';
import 'package:project_4/two_players/two_players_games/tic_tak_toe/tic_tak_toe_game.dart';

class TwoPlayersGamesList extends StatelessWidget {
  const TwoPlayersGamesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(children: [
          const SizedBox(),
          Expanded(
            child: Container(
              height: 385,
              color: Colors.blue,
              child: Column(children: [
                const SizedBox(height: 8,),
                const Image(image: AssetImage('assets/tic_tak_toe.jpg'),
                  height: 300,),
                const SizedBox(height: 8,),
                ListTile(
                  trailing: const Hero(tag: 'TicTacToe', child: Icon(Icons.person,
                      color: Colors.limeAccent)),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TicTacToeGame(),
                    ),
                  ),
                  title: const Text('TicTacToe',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.limeAccent
                    ),),
                ),
              ],
              ),
            ),
          ),
          const SizedBox(),
        ]),
        Row(children: [
          const SizedBox(),
          Expanded(
            child: Container(
              height: 385,
              color: Colors.limeAccent,
              child: Column(children: [
                const SizedBox(height: 8,),
                const Image(image: AssetImage('assets/connect_foure_game.jpg'),
                  height: 300,),
                const SizedBox(height: 8,),
                ListTile(
                  trailing: const Hero(tag: 'ConnectFour', child: Icon(Icons.person, color: Colors.blue,)),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ConnectFour(),
                    ),
                  ),
                  title: const Text('TheMemoryMatchGame',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),),
                ),
              ],
              ),
            ),
          ),
          const SizedBox(),
        ]),
      ],
    );
  }
}