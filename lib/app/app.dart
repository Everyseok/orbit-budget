import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orbit_budget/app/router.dart';
import 'package:orbit_budget/core/services/preferences_service.dart';
import 'package:orbit_budget/core/theme/app_theme.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

// Source of truth for the current locale.
// MaterialApp reads from this; Settings screen writes to it.
final localeProvider = StateProvider<Locale>((ref) {
  final prefs = ref.watch(preferencesServiceProvider);
  final code = prefs.locale; // defaults to 'ko'
  return Locale(code);
});

class OrbitApp extends ConsumerWidget {
  const OrbitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      // l10n key used for OS-level app title; not shown in UI directly
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: buildAppTheme(),
      routerConfig: router,
      locale: locale,
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
        // Stage 3 multilingual expansion: add Locale('ja'), Locale('zh')
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

class OrbitShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const OrbitShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.radar),
            label: l10n.nav_dashboard,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.satellite_alt),
            label: l10n.nav_subscriptions,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle_outline),
            label: l10n.nav_expenses,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart),
            label: l10n.nav_analytics,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.tune),
            label: l10n.nav_settings,
          ),
        ],
      ),
    );
  }
}
