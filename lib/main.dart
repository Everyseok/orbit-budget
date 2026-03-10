import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/app/app.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/services/preferences_service.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/features/debt/repositories/isar_debt_repository.dart';
import 'package:orbit_budget/features/subscriptions/repositories/isar_subscription_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.deepSpace,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    // Stage 3: wire to crash reporting service
  };

  final prefs = await SharedPreferences.getInstance();
  final prefsService = PreferencesService(prefs);

  final isarService = IsarService();
  await isarService.init();
  await IsarSubscriptionRepository(isarService).seed();
  await IsarDebtRepository(isarService).seed();

  runApp(
    ProviderScope(
      overrides: [
        isarServiceProvider.overrideWithValue(isarService),
        preferencesServiceProvider.overrideWithValue(prefsService),
      ],
      observers: kDebugMode ? [_ProviderLogger()] : [],
      child: const OrbitApp(),
    ),
  );
}

class _ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('[Provider] ${provider.name ?? provider.runtimeType} updated');
  }
}
