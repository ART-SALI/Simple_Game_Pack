import 'package:flutter/material.dart';
import 'package:project_4/single_player/single_player_games/memory_game/ui/pages/startup_page.dart';

class TheMemoryMatchGame extends StatelessWidget {
  const TheMemoryMatchGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartUpPage(),
      title: 'The MemoryMatch Game',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}