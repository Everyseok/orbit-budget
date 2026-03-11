import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:orbit_budget/core/database/models/budget_setting.dart';
import 'package:orbit_budget/core/database/models/debt_account.dart';
import 'package:orbit_budget/core/database/models/expense_entry.dart';
import 'package:orbit_budget/core/database/models/graph_preset.dart';
import 'package:orbit_budget/core/database/models/payment_log.dart';
import 'package:orbit_budget/core/database/models/subscription_item.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        ExpenseEntrySchema,
        SubscriptionItemSchema,
        DebtAccountSchema,
        PaymentLogSchema,
        BudgetSettingSchema,
        GraphPresetSchema,
      ],
      directory: dir.path,
      name: 'orbit_db',
    );
  }

  Isar get db => _isar;
}

// Override this in main() via ProviderScope.overrides
final isarServiceProvider = Provider<IsarService>((ref) {
  throw StateError(
    'IsarService must be initialized in main() and injected via ProviderScope.overrides',
  );
});
