import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orbit_budget/core/constants/routes.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/screens/analytics_screen.dart';
import 'package:orbit_budget/features/dashboard/screens/dashboard_screen.dart';
import 'package:orbit_budget/features/debt/screens/debt_screen.dart';
import 'package:orbit_budget/features/expenses/screens/expenses_screen.dart';
import 'package:orbit_budget/features/settings/screens/settings_screen.dart';
import 'package:orbit_budget/features/subscriptions/screens/subscriptions_screen.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';
import 'package:orbit_budget/app/app.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.dashboard,
    errorBuilder: (context, state) {
      final l10n = AppLocalizations.of(context);
      return Scaffold(
        body: Center(
          child: Text(
            l10n.route_notFound,
            style: AppTypography.bodyMedium(),
          ),
        ),
      );
    },
    // Stage 3: uncomment for onboarding redirect
    // redirect: (context, state) { ... },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            OrbitShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.dashboard,
              builder: (_, __) => const DashboardScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.subscriptions,
              builder: (_, __) => const SubscriptionsScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final l10n = AppLocalizations.of(context);
                    return Scaffold(
                      appBar:
                          AppBar(title: Text(l10n.route_detail_stage2)),
                      body: Center(
                        child: Text(l10n.route_detail_stage2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.expenses,
              builder: (_, __) => const ExpensesScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.analytics,
              builder: (_, __) => const AnalyticsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.settings,
              builder: (_, __) => const SettingsScreen(),
            ),
          ]),
        ],
      ),
      // Debt is outside bottom nav shell — reached via Dashboard button
      GoRoute(
        path: Routes.debt,
        builder: (_, __) => const DebtScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final l10n = AppLocalizations.of(context);
              return Scaffold(
                appBar: AppBar(title: Text(l10n.route_detail_stage2)),
                body: Center(child: Text(l10n.route_detail_stage2)),
              );
            },
          ),
        ],
      ),
    ],
  );
});
