import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamesapp/src/provider/game_provider.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: const <Widget>[
          Text("Free to Games", style: TextStyle(fontSize: 20,)),
        ],
      ),
    );
  }
}
