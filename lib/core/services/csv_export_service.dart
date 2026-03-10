import 'dart:convert';
import 'dart:io';

import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CsvExportService {
  CsvExportService._();

  // UTF-8 BOM — required for Korean Excel on Windows
  static const _bom = '\uFEFF';

  static Future<void> exportExpenses(List<ExpenseModel> expenses) async {
    final now = DateTime.now();
    final fn = 'orbit_expenses_'
        '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '.csv';
    final buf = StringBuffer(_bom);
    buf.writeln('날짜,금액,카테고리,메모');
    for (final e in expenses) {
      buf.writeln([
        e.date.toIso8601String().substring(0, 10),
        e.amount.toString(),
        e.category.name,
        _escape(e.memo),
      ].join(','));
    }
    await _share(buf.toString(), fn);
  }

  static Future<void> exportSubscriptions(List<SubscriptionModel> subs) async {
    final now = DateTime.now();
    final fn = 'orbit_subs_'
        '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '.csv';
    final buf = StringBuffer(_bom);
    buf.writeln('서비스,월 비용,상태,다음 결제일');
    for (final s in subs) {
      buf.writeln([
        _escape(s.name),
        s.monthlyCost.toString(),
        s.status.name,
        s.nextBillingDate.toIso8601String().substring(0, 10),
      ].join(','));
    }
    await _share(buf.toString(), fn);
  }

  static String _escape(String v) {
    if (v.contains(',') || v.contains('"') || v.contains('\n')) {
      return '"${v.replaceAll('"', '""')}"';
    }
    return v;
  }

  static Future<void> _share(String content, String filename) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsString(content, encoding: utf8);
    await Share.shareXFiles([XFile(file.path)], text: filename);
  }
}
