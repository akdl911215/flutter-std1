import 'package:flame/game.dart';
import 'package:game/animated_player.dart';
import 'package:game/game_background.dart';
import 'index.dart';

class HenrySomeOneGame extends StatefulWidget {
  const HenrySomeOneGame({Key? key}) : super(key: key);

  @override
  State createState() => _HenrySomeOneGameState();
}

class _HenrySomeOneGameState extends State {
  @override
  Widget build(BuildContext context) {
    return const GameWidget.controlled(
        gameFactory: MyStaticGame.new
    );
  }
}

class MyStaticGame extends FlameGame with HasCollisionDetection {

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
}

