import 'package:intl/intl.dart';

extension KRWFormatting on int {
  String toKRW() => '₩${NumberFormat('#,##0', 'ko_KR').format(this)}';
  String toKRWNoSymbol() => NumberFormat('#,##0', 'ko_KR').format(this);
}
