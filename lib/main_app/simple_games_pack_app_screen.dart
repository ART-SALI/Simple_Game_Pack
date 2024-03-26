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

class _SimpleGamesPackAppScreenState extends State<SimpleGamesPackAppScreen>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  late TabController tabController;

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
    tabController.animateTo(_pageIndex);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: body.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Widget> body = [
    const TwoPlayersGamesList(),
    const SinglePlayerGamesList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SimpleGamesPackDrawer(),
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: TabBarView(
        controller: tabController,
        children: body,
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
