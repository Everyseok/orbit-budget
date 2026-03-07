import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/enums.dart';

part 'debt_account.g.dart';

@Collection()
class DebtAccount {
  Id id = Isar.autoIncrement;
  String label = '';

  @Enumerated(EnumType.name)
  DebtAccountType type = DebtAccountType.loan;

  int startingBalance = 0;
  int currentBalance = 0;
  DateTime createdAt = DateTime.now();
}
