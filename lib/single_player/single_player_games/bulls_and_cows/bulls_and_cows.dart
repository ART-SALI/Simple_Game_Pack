import 'dart:math';

import 'package:flutter/material.dart';

class BullAndCows {
  String? _currentInfo;
  String? _currentNumber;
  String _realNumber = '';
  String _activeButtonText = 'Розпочати гру';
  int _gameStage = 0;
  final String _startInfo;


  BullAndCows(this._gameStage, this._startInfo);

  int get gameStage => _gameStage;

  set gameStage(int value) {
    _gameStage = value;
  }

  String infoText(){
    if(_currentInfo == null){
      return _startInfo;
    }
    return _currentInfo!;
  }


  set currentInfo(String value) {
    _currentInfo = value;
  }


  set currentNumber(String value) {
    _currentNumber = value;
  }

  String get realNumber => _realNumber;

  set realNumber(String value) {
    _realNumber = value;
  }

  String get activeButtonText => _activeButtonText;

  set activeButtonText(String value) {
    _activeButtonText = value;
  }

  void randGenerating() {
    _gameStage = 1;
    _realNumber = '';
    _activeButtonText = 'Confirm the combination';
    var rand = Random();
    int r0 = rand.nextInt(9);
    int r1 = rand.nextInt(9);
    while (r1 == r0) {
      r1 = rand.nextInt(9);
    }
    int r2 = rand.nextInt(9);
    while (r2 == r0 || r2 == r1) {
      r2 = rand.nextInt(9);
    }
    int r3 = rand.nextInt(9);
    while (r3 == r0 || r3 == r1 || r3 == r2) {
      r3 = rand.nextInt(9);
    }
    _realNumber =
        r0.toString() + r1.toString() + r2.toString() + r3.toString();

    print(_realNumber);
  }

  void checking({required TextEditingController inputController}) {
    if (inputController
        .text
        .length != 4) {
      print('-1');
      _currentInfo = "You have to write four unique digits";
    } else {
      _currentNumber = inputController.text;
      bool uniqueNumbers = true;
      for(int i = 0; i < 3; i++){
        if(_currentNumber!.contains(_currentNumber![i], i+1)){
          print('-2');
          _currentInfo = "You have to write four unique digits";
          uniqueNumbers = false;
          break;
        }
      }
      if(uniqueNumbers) {
        int bullNumber = 0;
        int cowNumber = 0;
        for (int i = 0; i < 4; i++) {
          if (_realNumber[i] == _currentNumber![i]) {
            bullNumber++;
          } else {
            if (_realNumber.contains(_currentNumber![i])) {
              cowNumber++;
            }
          }
        }
        if(bullNumber == 4){
          _activeButtonText = 'Start new game';
          _currentInfo = 'YOU WON!';
          _gameStage = 2;
        } else{
          _currentInfo = '$bullNumber bulls and $cowNumber cows';
        }
      }
    }

  }

  void surrender(){
    _activeButtonText = 'Start new game';
    _currentInfo = 'Right answer: $_realNumber';
    _gameStage = 2;
  }

  void gamePlay(TextEditingController myController){
    if(_gameStage == 0) {
      randGenerating();
    }else if(_gameStage == 1){
      checking(inputController: myController);
    } if(_gameStage == 3){
      surrender();
    } else{
      randGenerating();
    }
  }

}