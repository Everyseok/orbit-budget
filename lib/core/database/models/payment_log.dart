import 'package:isar/isar.dart';

part 'payment_log.g.dart';

@Collection()
class PaymentLog {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  int debtAccountId = 0;

  int amount = 0;

  @Index(type: IndexType.value)
  late DateTime date;

  String memo = '';
}
