import 'package:flutter/material.dart';
import 'package:project_4/single_player/single_player_games/bulls_and_cows/bulls_and_cows_screen.dart';
import 'package:project_4/single_player/single_player_games/memory_game/the_memory_match_game.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/screens/main_screen.dart';

class SinglePlayerGamesList extends StatelessWidget {
  const SinglePlayerGamesList({
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
                const Image(image: AssetImage('assets/rock_paper_scissors.jpg'),
                height: 300,),
                const SizedBox(height: 8,),
                ListTile(
                  trailing: const Hero(tag: 'RockPaperScissors', child: Icon(Icons.person,
                      color: Colors.limeAccent)),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainScreenOfRockPaperScissors(),
                    ),
                  ),
                  title: const Text('RockPaperScissors',
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
                const Image(image: AssetImage('assets/memory_match_game.jpg'),
                height: 300,),
                const SizedBox(height: 8,),
                ListTile(
                  trailing: const Hero(tag: 'TheMemoryMatchGame', child: Icon(Icons.person, color: Colors.blue,)),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TheMemoryMatchGame(),
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
        Row(children: [
          const SizedBox(),
          Expanded(
            child: Container(
              height: 385,
              color: Colors.blue,
              child: Column(children: [
                const SizedBox(height: 8,),
                const Image(image: AssetImage('assets/bulls_and_cows.jpg'),
                  height: 300,),
                const SizedBox(height: 8,),
                ListTile(
                  trailing: const Hero(tag: 'BullsAndCows', child: Icon(Icons.pets, color: Colors.limeAccent,)),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BullsAndCowsScreen(),
                    ),
                  ),
                  title: const Text('BullsAndCows',
                    style: TextStyle(
                      color: Colors.limeAccent,
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