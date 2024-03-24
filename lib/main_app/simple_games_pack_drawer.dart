import 'package:flutter/material.dart';

class SimpleGamesPackDrawer extends StatelessWidget {
  const SimpleGamesPackDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          Expanded(child: SizedBox()),
          Text('Made by S4L1',
            style: TextStyle(
                fontSize: 32
            ),),
          Expanded(child: SizedBox()),
        ],
      )
      );
  }
}