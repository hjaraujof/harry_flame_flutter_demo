import 'dart:ui';
import 'package:flame/sprite.dart';

import '../harry-game.dart';

class Background {
  final HarryGame game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game, Sprite sprite) {
    bgRect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
    );
    bgSprite = sprite;
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
