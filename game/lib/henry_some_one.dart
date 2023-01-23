import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/animated_player.dart';
import 'package:game/game_background.dart';
import 'package:game/item.dart';
import 'package:game/item_list_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'index.dart';

class HenrySomeOneGame extends StatefulWidget {
  const HenrySomeOneGame({Key? key}) : super(key: key);

  @override
  State createState() => _HenrySomeOneGameState();
}

class _HenrySomeOneGameState extends State {

  List<int> list = [];
  void onTapItem(int index) {
    debugPrint(index.toString());
    if(list.contains(index)) return;
    list.add(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 40,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      panel: ItemListBottomSheet(onTapItem: onTapItem ,),
      body: GameWidget.controlled(
        gameFactory: () => MyStaticGame(list: list),
        loadingBuilder: (context) => const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorBuilder: (context, ex) => const Material(
          child: Center(
            child: Text('Error!!!'),
          ),
        ),
      ),
    );
  }
}

class MyStaticGame extends FlameGame with HasCollisionDetection {

  List<int> list;
  MyStaticGame({ required this.list });

  @override
  Color backgroundColor() => const Color(0x00000000);

  final GameBackGround _backGround = GameBackGround();

  @override
  Future onLoad() async {
    add(ScreenHitbox());
    await add(_backGround);

    final playerSize = Vector2(150, 100);
    final playerPosition = Vector2(200, 600);
    add(AnimatedPlayer(playerPosition, playerSize));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(list.isEmpty) return;
    Vector2 position = Vector2(list.last * 50, 100);
    add(Item(position, index: list.last));
  }


}

