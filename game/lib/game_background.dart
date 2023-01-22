import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class GameBackGround extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox());
    sprite = await gameRef.loadSprite('dog.jpeg');

    final gameSize = gameRef.size;
    size = Vector2(gameSize.x, gameSize.y);
  }
}