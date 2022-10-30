import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamesapp/src/models/Games.dart';

import '../../models/Games.dart';

class GameScreen extends StatelessWidget {
  final List<Screenshot> screen;
  const GameScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return screen.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: screen.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10.0),
              child: Image(image: NetworkImage(screen[index].image)),
            ),
          );
  }
}
