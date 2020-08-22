import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './harry-game.dart';

import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupFlame();

  HarryGame game = HarryGame();
  runApp(game.widget);

  addGestures(game);
}

void setupFlame() {
  Flame.images.load('bg/main.gif');
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
}

void addGestures(HarryGame game) {
  Util flameUtil = Util();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
