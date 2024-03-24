import 'package:flutter/material.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/screens/results_screen.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/utilis/game.dart';
import 'package:project_4/single_player/single_player_games/rock_paper_scisor/widgets/buttom.dart';

class MainScreenOfRockPaperScissors extends StatefulWidget {
  const MainScreenOfRockPaperScissors({super.key});

  @override
  _MainScreenStateOfRockPaperScissors createState() => _MainScreenStateOfRockPaperScissors();
}

class _MainScreenStateOfRockPaperScissors extends State<MainScreenOfRockPaperScissors> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          (btnWidth / 2) -
                          20, // we soustract the half of ther widget size and the half of the padding,
                      child: Hero(
                        tag: "Rock",
                        child: gameBtn(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Rock")),
                            ),
                          );
                          setState(() {
                            Game.gameScore;
                          });
                        }, "assets/rock_btn.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth -
                          40, // we soustract the half of ther widget size and the half of the padding,
                      child: Hero(
                        tag: "Scisors",
                        child: gameBtn(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Scisors")),
                            ),
                          );
                          setState(() {
                            Game.gameScore;
                          });
                        }, "assets/scisor_btn.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right: MediaQuery.of(context).size.width / 2 -
                          btnWidth -
                          40, // we soustract the half of ther widget size and the half of the padding,
                      child: Hero(
                        tag: "Paper",
                        child: gameBtn(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Paper")),
                            ),
                          );
                          setState(() {
                            Game.gameScore;
                          });
                        }, "assets/paper_btn.png", btnWidth),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}