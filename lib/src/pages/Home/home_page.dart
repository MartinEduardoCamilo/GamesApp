import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/game_provider.dart';
import '../../widget/cardItem.dart';
import 'home_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {

@override
  void initState() {
    ref.read(gameProvider).getListGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listGames = ref.watch(gameProvider);
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const HomeHeader(),
          listGames.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: listGames.gamelist?.length,
                    itemBuilder: (context, index) => CardItem(
                      element: listGames.gamelist![index],
                    ),
                  ),
              ),
        ],
      ),
    ));
  }

   @override
  void dispose() {
    super.dispose();
  }
}
