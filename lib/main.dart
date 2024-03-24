import 'package:flutter/material.dart';
import 'package:project_4/main_app/simple_games_pack_app_screen.dart';

void main() {
  runApp(const SimpleGamesPackApp());
}

class SimpleGamesPackApp extends StatelessWidget {
  const SimpleGamesPackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Color(0xff242C1F),
      debugShowCheckedModeBanner: false,
      home: SimpleGamesPackAppScreen(),
    );
  }
}