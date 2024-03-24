import 'package:flutter/material.dart';
import 'package:project_4/main_app/simple_games_pack_drawer.dart';
import 'package:project_4/single_player/single_player_games_list.dart';
import 'package:project_4/two_players/two_players_games_list.dart';

class SimpleGamesPackAppScreen extends StatefulWidget {
  const SimpleGamesPackAppScreen({super.key});

  @override
  _SimpleGamesPackAppScreenState createState() =>
      _SimpleGamesPackAppScreenState();
}

class _SimpleGamesPackAppScreenState extends State<SimpleGamesPackAppScreen> {

  int _pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SimpleGamesPackDrawer(),
      backgroundColor: Colors.cyan,
      appBar: AppBar(backgroundColor: Colors.green,),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _pageIndex != 0,
            child: TickerMode(
              enabled: _pageIndex == 0,
              child: const TwoPlayersGamesList(),
            ),
          ),
          Offstage(
            offstage: _pageIndex != 1,
            child: TickerMode(
              enabled: _pageIndex == 1,
              child: const SinglePlayerGamesList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Two players games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Single player games',
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}





