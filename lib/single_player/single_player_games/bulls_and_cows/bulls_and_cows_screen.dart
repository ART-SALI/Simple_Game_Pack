import 'package:flutter/material.dart';
import 'package:project_4/single_player/single_player_games/bulls_and_cows/bulls_and_cows.dart';

class BullsAndCowsScreen extends StatefulWidget {
  const BullsAndCowsScreen({super.key});

  @override
  State<BullsAndCowsScreen> createState() => _BullsAndCowsScreenState();
}

class _BullsAndCowsScreenState extends State<BullsAndCowsScreen> {
  BullAndCows game = BullAndCows(0, 'Here will be info about bulls and cows');
  final myController = TextEditingController();
  String? textInfo;
  String buttonText = 'Start game';

  TextStyle globalTextStyle =
      const TextStyle(fontSize: 20.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.blueGrey,
      body: _mainBody(),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        'Bulls And Cows',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.black38,
    );
  }

  Widget _mainBody() {
    textInfo ??= game.infoText();
    return ListView(
      children: [
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Text(
              textInfo!,
              textAlign: TextAlign.center,
              style: globalTextStyle,
            ),
            const SizedBox(
              height: 45,
            ),
            textFormField(),
            const SizedBox(
              height: 30,
            ),
            gameButton(),
            const SizedBox(
              height: 30,
            ),
            surrenderButton(),
            const SizedBox(
              height: 200,
            ),
          ],
        )),
      ],
    );
  }

  TextFormField textFormField() {
    return TextFormField(
      textAlign: TextAlign.center,
      style: globalTextStyle,
      controller: myController,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.black38,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  ElevatedButton gameButton() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.black38;
          }),
        ),
        onPressed: () {
          game.gamePlay(myController);

          setState(() {
            buttonText = game.activeButtonText;
            textInfo = game.infoText();
          });
        },
        child: Text(
          buttonText,
          style: globalTextStyle,
        ));
  }

  ElevatedButton surrenderButton() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.black38;
          }),
        ),
        onPressed: () {
          game.gameStage = 3;
          game.gamePlay(myController);

          setState(() {
            buttonText = game.activeButtonText;
            textInfo = game.infoText();
          });
        },
        child: Text(
          'Surrender',
          style: globalTextStyle,
        ));
  }
}
