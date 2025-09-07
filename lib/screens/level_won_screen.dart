import 'package:flutter/material.dart';
import 'package:the_green_ninja/games/the_green_ninja_game.dart';

import '../enums/map_id.dart';

class LevelWonScreen extends StatelessWidget {
  const LevelWonScreen({Key? key}) : super(key: key);

  static const String id = 'level_won';

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent.withValues(alpha: 0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You won, Green Ninja!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => selectMap(MapId.one),
                child: const Text('Play Again?'),
              )
            ],
          ),
        ),
      );
}
