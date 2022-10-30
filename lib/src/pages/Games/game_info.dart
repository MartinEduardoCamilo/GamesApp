import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/Games.dart';

class GameInfo extends ConsumerWidget {
  final Games games;
  const GameInfo({super.key, required this.games});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text("Description"),
              subtitle: Text(games.description!),
            ),
             ListTile(
              title: const Text("Platform"),
              subtitle: Text(games.platform!),
            ),
             ListTile(
              title: const Text("Publisher"),
              subtitle: Text(games.publisher!),
            ),
             ListTile(
              title: const Text("Developer"),
              subtitle: Text(games.developer!),
            ),
          ],
        ),
      ),
    );
  }
}
