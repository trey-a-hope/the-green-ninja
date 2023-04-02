import 'package:flutter/material.dart';
import 'package:the_green_ninja/games/the_green_ninja_game.dart';
import '../enums/map_id.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({
    Key? key,
  }) : super(key: key);

  static const String iD = 'game_over';

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent.withOpacity(0.75),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sorry, you lose.',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () => selectMap(MapId.one),
                child: const Text(
                  'Play Again',
                ),
              )
            ],
          ),
        ),
      );
}
