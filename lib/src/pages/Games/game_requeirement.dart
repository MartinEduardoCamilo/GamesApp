import 'package:flutter/cupertino.dart';

import '../../models/Games.dart';

class GameRequeriment extends StatelessWidget {
  final Games games;
  const GameRequeriment({super.key,required this.games});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}