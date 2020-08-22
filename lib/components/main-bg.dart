import 'package:flame/sprite.dart';
import '../harry-game.dart';

import './background.dart';

class MainBg extends Background {
  final HarryGame game;

  MainBg(this.game) : super(game, Sprite('bg/main.gif')) {}
}
