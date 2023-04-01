import 'package:bonfire/bonfire.dart';
import 'package:the_green_ninja/constants/globals.dart';

class DarkNinjaSpriteSheet {
  static Future<void> load() async {
    final image = await Flame.images.load(Globals.darkNinjaSpriteSheet);
    spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 4,
      rows: 7,
    );
  }

  static late SpriteSheet spriteSheet;
}
