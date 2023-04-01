import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/npcs/old_man_npc.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';

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
      player: GreenNinjaPlayer(
        position: Vector2(40, 40),
      ),
      map: WorldMapByTiled(
        Globals.mapOne,
        forceTileSize: Vector2(
          Globals.defaultTileSize,
          Globals.defaultTileSize,
        ),
        objectsBuilder: {
          'old_man': (TiledObjectProperties properties) => OldManNPC(
                position: properties.position,
              ),
        },
      ),
    );
  }
}
