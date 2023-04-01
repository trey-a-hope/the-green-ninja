import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/globals.dart';

class TheGreenNinjaGame extends StatefulWidget {
  const TheGreenNinjaGame({Key? key}) : super(key: key);

  @override
  State<TheGreenNinjaGame> createState() => _TheGreenNinjaGameState();
}

class _TheGreenNinjaGameState extends State<TheGreenNinjaGame> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: WorldMapByTiled(
        Globals.mapOne,
        forceTileSize: Vector2(
          Globals.defaultTileSize,
          Globals.defaultTileSize,
        ),
      ),
    );
  }
}
