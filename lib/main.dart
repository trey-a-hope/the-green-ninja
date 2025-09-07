import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/games/the_green_ninja_game.dart';
import 'package:the_green_ninja/sprite_sheets/sprite_sheets.dart';
import 'package:window_pain/window_pain.dart';

late Logger logger;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GreenNinjaSpriteSheet.load();
  await BlueNinjaSpriteSheet.load();
  await OldManSpriteSheet.load();
  await DarkNinjaSpriteSheet.load();

  await FlameAudio.audioCache.loadAll(
    [
      Globals.gameOverSound,
      Globals.powerUpSound,
      Globals.successSound,
      Globals.explosionSound,
      Globals.fireSound,
    ],
  );

  logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        noBoxingByDefault: false,
      ),
    ),
    output: null,
  );

  await WindowPain.maximizeWindow();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TheGreenNinjaGame(),
    );
  }
}
