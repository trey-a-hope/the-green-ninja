import 'package:flutter/material.dart';
import 'package:the_green_ninja/enums/map_id.dart';
import 'package:the_green_ninja/games/the_green_ninja_game.dart';

class LevelWonScreen extends StatelessWidget {
  const LevelWonScreen({
    Key? key,
  }) : super(key: key);

  static const String iD = 'level_won';

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent.withOpacity(0.75),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You won, Green Ninja!',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.green,
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
