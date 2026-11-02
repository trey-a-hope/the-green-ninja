# The Green Ninja

A top-down dungeon action game built with Flutter and [Bonfire](https://bonfire-engine.github.io). You play the Green Ninja: fight your way through a dimly lit dungeon of dark ninjas and demons, find the blue ninja who holds the coin, beat him and grab it to win the level.

## Gameplay

- **Move** with the on-screen joystick or the keyboard (arrow keys / WASD).
- **Melee attack** (button or `Space`) deals 20 damage; **ranged attack** (button or `Enter`) throws a projectile for 10.
- The Green Ninja has 100 life and a life bar; enemies show damage numbers when hit.
- **Enemies**: dark ninjas and demons sometimes drop a **medipack** (+25 life) when they die; the **blue ninja** drops the **coin**.
- **Fire** tiles burn for 5 damage on contact.
- Picking up the coin shows the *Level Won* screen; running out of life shows *Game Over*.
- An old man NPC stands in the map (his dialogue is written but currently commented out).
- A mini map overlay and dark lighting make the dungeon feel enclosed.

## How it works

`TheGreenNinjaGame` (`lib/games/the_green_ninja_game.dart`) builds a `BonfireWidget` from a Tiled map (`assets/images/map_one.json`, dungeon tileset) and spawns map objects by name through `objectsBuilder`: `old_man`, `dark_ninja`, `demon`, `blue_ninja` and `fire`. `MapId` has slots for three maps; only map one is wired up today.

```
lib/
├── main.dart
├── games/          # TheGreenNinjaGame (map, controls, overlays, lighting)
├── players/        # GreenNinjaPlayer
├── enemies/        # dark ninja, demon, blue ninja
├── npcs/           # old man
├── decorations/    # coin, medipack, fire
├── sprite_sheets/  # sprite sheet loaders
├── screens/        # game over, level won overlays
├── constants/      # globals (asset names), animation configs
└── enums/          # MapId, AttackType
assets/
├── images/         # Tiled map + tilesets, sprite sheets, items, effects
└── audio/effects/
```

## Tech stack

- Flutter, Dart `>=3.0.0 <4.0.0`
- `bonfire` 3.15, `flame_audio`
- [`window_pain`](https://pub.dev/packages/window_pain) to open maximized on desktop, `logger`

## Running it

```sh
flutter pub get
flutter run        # mobile, web or desktop
```

## Testing

```sh
flutter test
```
