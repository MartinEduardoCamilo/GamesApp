import 'package:flutter/material.dart';
import '../../models/Games.dart';

class GameRequeriment extends StatelessWidget {
  final MinimumSystemRequirements requirements;
  const GameRequeriment({super.key, required this.requirements});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child:  requirements.os!.isEmpty ? const SizedBox.shrink() :
        Column(
          children: <Widget>[
            ListTile(
              title: const Text("Operating system"),
              subtitle: Text(requirements.os!),
            ),
            ListTile(
              title: const Text("Processor"),
              subtitle: Text(requirements.processor!),
            ),
            ListTile(
              title: const Text("Memory"),
              subtitle: Text(requirements.memory!),
            ),
            ListTile(
              title: const Text("Graphics"),
              subtitle: Text(requirements.graphics!),
            ),
             ListTile(
              title: const Text("Storage"),
              subtitle: Text(requirements.storage!),
            )
          ],
        ),
      ),
    );
  }
}
