# Court Medic (Demo)

A runnable Flutter demo of the Court Medic wireframes: splash/login, home,
common injuries list + detail pages (skin wound, bruise, cramp, torn
toenail — each with a small interactive widget), preparation/first-aid
products, notifications tab, and profile/settings.

This is a UI-only demo: there's no backend, and "Login"/"Sign Up" both just
go straight into the app.

## Run it

You need the Flutter SDK installed (flutter.dev/docs/get-started/install).

```bash
cd court_medic
flutter pub get
flutter run
```

Pick any connected device/emulator/simulator, or run `flutter run -d chrome`
for a quick web preview.

## Project structure

```
lib/
  main.dart                     # App entry point
  theme/app_theme.dart          # Colors, hand-drawn font, ThemeData
  models/injury.dart            # Injury data + demo dataset
  models/product.dart           # First-aid product data
  widgets/common_widgets.dart   # Search bar, rating badge, list tile, app bar
  widgets/injury_interactives.dart # Per-injury interactive widgets
  screens/
    splash_screen.dart          # Logo + Login/Sign Up
    home_shell.dart             # Bottom nav host (Home/Notification/Profile)
    home_screen.dart            # Home tab
    notification_screen.dart    # Notification tab
    profile_screen.dart         # Profile tab (Setting/Logout)
    settings_screen.dart        # Setting sub-page
    common_injuries_screen.dart # Injury list
    injury_detail_screen.dart   # Injury detail (About + interactive)
    preparation_screen.dart     # First-aid product catalogue
assets/images/logo.png          # Your app icon, used on the splash screen
```

## What's interactive right now

- **Bruise** page: drag the slider to see a rough severity read-out.
- **Cramp** page: pick a stretch option and tap the green pill to start/stop
  a real 20-second hold countdown.
- **Skin wound** page: tick off a care checklist.
- **Torn toenail** page: step through a 4-step care flow with Back/Next.
- **Preparation** page: search filters the product grid; "See all" expands
  it; tapping a product opens a bottom sheet with its description.
- **Profile → Logout** shows a confirm dialog and returns to the splash
  screen.

## Next steps for a real build

- Replace the icon/gradient placeholders in `models/injury.dart` and
  `models/product.dart` with real photos (`Image.asset` or `Image.network`).
- Wire `splash_screen.dart`'s Login/Sign Up to real auth.
- Replace the `[Your name]` / `[From dev]` / `[Dates]` placeholders with
  real user + CMS data.
