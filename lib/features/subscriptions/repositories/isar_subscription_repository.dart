import 'package:isar/isar.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/database/models/subscription_item.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/features/subscriptions/repositories/subscription_repository.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';

class IsarSubscriptionRepository implements SubscriptionRepository {
  final IsarService _svc;
  IsarSubscriptionRepository(this._svc);

  Isar get _db => _svc.db;

  @override
  Future<void> seed() async {
    if (await _db.subscriptionItems.count() > 0) return;
    final now = DateTime.now();
    final defaults = [
      _item('Netflix', 17000, 'https://www.netflix.com/account', '🎬', now),
      _item('YouTube Premium', 14900,
          'https://myaccount.google.com/subscriptions', '▶️', now),
      _item('Spotify', 10900,
          'https://www.spotify.com/account/subscription/change', '🎵', now),
      _item('ChatGPT Plus', 27000,
          'https://chat.openai.com/account/subscription', '🤖', now),
      _item('Claude Pro', 22000, 'https://claude.ai/settings/billing', '🪐', now),
      _item('쿠팡 Rocket WOW', 7890,
          'https://www.coupang.com/np/member/rocketwow', '📦', now),
      _item('네이버 플러스', 4900,
          'https://new.mypage.naver.com/membership', '🟢', now),
      _item('왓챠', 12900, 'https://watcha.com/settings/membership', '🍿', now),
      _item('티빙', 13500, 'https://www.tving.com/membership', '📺', now),
      _item('웨이브', 10900, 'https://www.wavve.com/membership', '🌊', now),
      _item('밀리의서재', 9900,
          'https://www.millie.co.kr/v3/settings/membership', '📚', now),
      _item('iCloud+ 50GB', 1400,
          'App-prefs:root=CASTLE&path=STORAGE', '☁️', now),
    ];
    await _db.writeTxn(() => _db.subscriptionItems.putAll(defaults));
  }

  SubscriptionItem _item(
      String name, int cost, String url, String emoji, DateTime now) =>
      SubscriptionItem()
        ..name = name
        ..monthlyCost = cost
        ..manageUrl = url
        ..logoEmoji = emoji
        ..billingDay = 1
        ..status = SubscriptionStatus.active
        ..nextBillingDate = _nextBilling(1, now)
        ..createdAt = now;

  DateTime _nextBilling(int day, DateTime from) {
    final t = DateTime(from.year, from.month, day);
    return t.isAfter(from) ? t : DateTime(from.year, from.month + 1, day);
  }

  @override
  Stream<List<SubscriptionModel>> watchAll() =>
      _db.subscriptionItems
          .where()
          .sortByName()
          .watch(fireImmediately: true)
          .map((l) => l.map(SubscriptionModel.fromEntity).toList());

  @override
  Future<void> add(SubscriptionModel m) async {
    final now = DateTime.now();
    final e = SubscriptionItem()
      ..name = m.name
      ..monthlyCost = m.monthlyCost
      ..billingDay = m.billingDay
      ..status = m.status
      ..manageUrl = m.manageUrl
      ..logoEmoji = m.logoEmoji
      ..nextBillingDate = _nextBilling(m.billingDay, now)
      ..createdAt = now;
    await _db.writeTxn(() => _db.subscriptionItems.put(e));
  }

  @override
  Future<void> update(SubscriptionModel m) async {
    final e = await _db.subscriptionItems.get(m.id);
    if (e == null) return;
    e
      ..name = m.name
      ..monthlyCost = m.monthlyCost
      ..billingDay = m.billingDay
      ..status = m.status
      ..manageUrl = m.manageUrl
      ..logoEmoji = m.logoEmoji
      ..nextBillingDate = _nextBilling(m.billingDay, DateTime.now());
    await _db.writeTxn(() => _db.subscriptionItems.put(e));
  }

  @override
  Future<void> delete(int id) async =>
      _db.writeTxn(() => _db.subscriptionItems.delete(id));
}
