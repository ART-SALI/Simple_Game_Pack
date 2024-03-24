import 'package:flutter/material.dart';
import 'package:project_4/single_player/single_player_games/memory_game/ui/widgets/mobile/game_board_mobile.dart';


class MemoryMatchPage extends StatelessWidget {
  const MemoryMatchPage({
    required this.gameLevel,
    super.key,
  });

  final int gameLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: ((context, constraints) {
              return GameBoardMobile(
                gameLevel: gameLevel,
              );
          }),
        ),
      ),
    );
  }
}