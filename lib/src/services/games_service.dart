import 'dart:convert';
import 'package:http/http.dart';
import '../models/Games.dart';

class GameService {
  final String url = "https://www.freetogame.com/api/games";

  Future<List<Games>> getGames() async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Games> games = data.map((dynamic e) => Games.fromJson(e)).toList();
        return games;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Games> findGames(int id) async {
    Response response = await get(Uri.parse("https://www.freetogame.com/api/game?id=$id"));
    if (response.statusCode == 200) {
      var data= json.decode(response.body);
      return Games.fromJson(data);
    } else {
      throw Exception('Failed to load a game');
    }
  }
}
