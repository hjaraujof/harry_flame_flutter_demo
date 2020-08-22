import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';

import './components/character.dart';
import 'components/main-bg.dart';

class HarryGame extends Game {
  Size screenSize;
  double tileSize;

  Character captain;
  Character player;
  List<Character> npcs;

  MainBg mainBg;

  Random rnd;

  HarryGame() {
    initialize();
  }

  void initialize() async {
    npcs = List<Character>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    mainBg = MainBg(this);

    spawnNpc();
  }

  void spawnNpc() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    npcs.add(Character(this, x, y));
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    mainBg.render(canvas);

    npcs.forEach((Character character) => character.render(canvas));
  }

  void update(double t) {
    npcs.forEach((Character character) => character.update(t));
    npcs.removeWhere((Character character) => character.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    npcs.forEach((Character character) {
      if (character.characterRect.contains(d.globalPosition)) {
        character.onTapDown();
      }
    });
  }
}
