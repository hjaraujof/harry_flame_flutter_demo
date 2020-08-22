import 'dart:ui';
import '../harry-game.dart';

class Character {
  final HarryGame game;
  Rect characterRect;
  Paint characterPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Character(this.game, double x, double y) {
    characterRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    characterPaint = Paint();
    characterPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(characterRect, characterPaint);
  }

  void update(double t) {
    if (isDead) {
      characterRect = characterRect.translate(0, game.tileSize * 12 * t);
    }
    if (characterRect.top > game.screenSize.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
    characterPaint.color = Color(0xffff4757);
    isDead = true;
    game.spawnNpc();
  }
}
