import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/enums.dart';

part 'expense_entry.g.dart';

@Collection()
class ExpenseEntry {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late DateTime date;

  int amount = 0;

  @Enumerated(EnumType.name)
  CategoryType category = CategoryType.other;

  String memo = '';
  bool isRecurring = false;
  // Stage 3 reserved: String? sourceTag;
}
