import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamesapp/src/pages/Games/game_requeirement.dart';
import 'package:gamesapp/src/pages/Games/games_screenshot.dart';
import '../../provider/game_provider.dart';
import 'game_info.dart';

class DetailPage extends ConsumerWidget {
  final int id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.read(gameProvider);
    return FutureBuilder(
        future: games.findGames(id),
        initialData: null,
        builder: (context, snapshot) {
          if (games.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    snapshot.data!.title!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                body: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        width: 500,
                        child: Image(
                            image: NetworkImage(snapshot.data!.thumbnail!),
                            fit: BoxFit.fill),
                      ),
                      const TabBar(
                        indicatorColor: Colors.black,
                        tabs: <Widget>[
                          Tab(
                              child: Text(
                            'Info',
                            style: TextStyle(color: Colors.black),
                          )),
                          Tab(
                            child: Text('Requeriment',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Tab(
                              child: Text('Screenshots',
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            GameInfo(
                              games: snapshot.data!,
                            ),
                            snapshot.data!.minimumSystemRequirements != null
                                ? GameRequeriment(
                                    requirements: snapshot
                                        .data!.minimumSystemRequirements!)
                                : const SizedBox(
                                    child: Center(
                                    child: Text("No Found!",style: TextStyle(fontSize: 18),),
                                  )),
                            GameScreen(screen: snapshot.data!.screenshots!)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
