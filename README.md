# ORBIT — Budget Tracker

Personal finance app. Debt payoff · subscription management · daily expenses.
Built with Flutter (iOS + Android).

## Requirements
- Flutter 3.24+ / Dart 3.4+
  (Requires Color.withValues() API, stable since Flutter 3.24)

## Tech Stack
- State: flutter_riverpod
- Database: Isar 3 (local only — no server, no network calls)
- Navigation: go_router (StatefulShellRoute.indexedStack)
- i18n: flutter_localizations (ko/en complete, ja/zh scaffolded)

## First-time Setup

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter run
```

> **Important**: `*.g.dart` and `lib/src/l10n/` are gitignored.
> Always run `build_runner` and `gen-l10n` after cloning.

## Architecture

```
UI → Provider → Repository → IsarService
```
No layer skipping. All state via Riverpod. All domain data in Isar.
Localized text is never stored in the database — only enum types are stored.

## Project Structure

```
lib/
├── core/       # Constants, DB models, theme, services, extensions, utils
├── features/   # dashboard · subscriptions · expenses · debt · analytics · settings
└── shared/     # Immutable app-layer models + reusable widgets
```

## Branching Strategy

```
main
  └── feature/stage-N-description  →  PR  →  merge into main
```

- `main` — production-ready only
- `feature/stage-N-*` — all work happens here, merged via PR

## Stage Progress
- [x] Stage 1: Foundation
- [x] Stage 2: CRUD + GitHub setup
- [ ] Stage 3: Analytics + notifications + export
- [ ] Stage 4: Release build + store assets
- [ ] Stage 5: App Store + Google Play submission
- [ ] Stage 6: Post-launch monitoring
