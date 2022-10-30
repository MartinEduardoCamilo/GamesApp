import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Games.dart';
import '../services/games_service.dart';

final gameProvider = ChangeNotifierProvider.autoDispose<GameProvider>((ref) {
  return GameProvider();
});

class GameProvider extends ChangeNotifier {
  final GameService gameService = GameService();
  Games? games = Games();
  final List<Games>? gamelist = [];
  bool loading = false;

  Future<Games> findGames(int id) async {
    loading = true;
    final data = await gameService.findGames(id);
    loading = false;
    games = data;
    notifyListeners();
    return data;
  }

  Future<void> getListGames() async {
    loading = true;
    gamelist?.addAll(await gameService.getGames());
    loading = false;
    notifyListeners();
  }


}

