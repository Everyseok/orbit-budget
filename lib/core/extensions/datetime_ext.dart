import 'package:intl/intl.dart';

extension DateTimeKorean on DateTime {
  String toKoreanDate() => DateFormat('yyyy년 M월 d일', 'ko_KR').format(this);
  String toKoreanShortDate() => DateFormat('M월 d일', 'ko_KR').format(this);
  String toBillingDisplay() => DateFormat('MM.dd').format(this);
  bool isSameDay(DateTime o) =>
      year == o.year && month == o.month && day == o.day;
  bool isSameMonth(DateTime o) => year == o.year && month == o.month;
}
