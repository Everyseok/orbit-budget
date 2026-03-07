// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'ORBIT';

  @override
  String get nav_dashboard => '미션 컨트롤';

  @override
  String get nav_subscriptions => '구독 관리';

  @override
  String get nav_expenses => '지출 기록';

  @override
  String get nav_analytics => '분석';

  @override
  String get nav_settings => '설정';

  @override
  String get nav_debt => '부채 관리';

  @override
  String get placeholder_stage2 => 'Stage 2: 여기에 실제 데이터가 표시됩니다';

  @override
  String get placeholder_stage3 => 'Stage 3: 분석 화면이 여기에 표시됩니다';

  @override
  String get route_notFound => '페이지를 찾을 수 없습니다';

  @override
  String get route_detail_stage2 => '상세 화면 — Stage 2에서 구현 예정';

  @override
  String get dashboard_label_totalDebt => '총 부채';

  @override
  String get dashboard_label_monthlyBudget => '월 예산';

  @override
  String get dashboard_label_todayBurn => '오늘 지출';

  @override
  String get dashboard_label_monthlySubscriptions => '이번 달 구독';

  @override
  String get dashboard_label_recentTransactions => '최근 거래';

  @override
  String get dashboard_label_debtClearance => '부채 청산율';

  @override
  String get dashboard_label_fuelGauge => '예산 연료계';

  @override
  String get dashboard_action_manageDebt => '부채 관리';

  @override
  String get subscription_title => '구독 관리 센터';

  @override
  String get subscription_label_active => '활성';

  @override
  String get subscription_label_paused => '일시정지';

  @override
  String get subscription_label_cancelling => '해지 중';

  @override
  String get subscription_label_nextBilling => '다음 결제';

  @override
  String get subscription_label_monthlyTotal => '월 합계';

  @override
  String subscription_label_activeCount(int count) {
    return '활성 구독 $count개';
  }

  @override
  String get subscription_button_manage => '구독 변경 →';

  @override
  String get subscription_button_add => '구독 추가';

  @override
  String get subscription_action_pause => '일시정지';

  @override
  String get subscription_action_delete => '삭제';

  @override
  String get subscription_action_resume => '재개';

  @override
  String get subscription_error_urlLaunch => '브라우저를 열 수 없습니다';

  @override
  String get expense_title => '일일 지출';

  @override
  String get expense_label_today => '오늘';

  @override
  String get expense_label_yesterday => '어제';

  @override
  String get expense_label_dailyTotal => '일 합계';

  @override
  String get expense_button_add => '지출 추가';

  @override
  String get expense_action_delete => '삭제';

  @override
  String get expense_hint_memo => '메모 (선택사항)';

  @override
  String get expense_label_category => '카테고리';

  @override
  String get expense_label_amount => '금액 (원)';

  @override
  String get category_food => '식비';

  @override
  String get category_transport => '교통';

  @override
  String get category_living => '생활용품';

  @override
  String get category_telecom => '통신/구독';

  @override
  String get category_health => '의료/건강';

  @override
  String get category_other => '기타';

  @override
  String get debt_title => '부채 관리';

  @override
  String get debt_label_studentLoan => '학자금 대출';

  @override
  String get debt_label_creditCard => '신용카드';

  @override
  String get debt_label_currentBalance => '현재 잔액';

  @override
  String get debt_label_startingBalance => '초기 잔액';

  @override
  String get debt_label_paidOff => '상환 완료';

  @override
  String get debt_label_combinedTotal => '총 부채';

  @override
  String get debt_button_logPayment => '상환 기록';

  @override
  String get debt_label_paymentHistory => '상환 내역';

  @override
  String get analytics_title => '미션 리포트';

  @override
  String get analytics_label_monthlyBreakdown => '월별 지출 분석';

  @override
  String get analytics_label_spendingTrend => '30일 지출 추이';

  @override
  String get analytics_label_debtProjection => '부채 청산 예측';

  @override
  String analytics_label_projectionResult(int months, String date) {
    return '현재 속도라면 $months개월 후 ($date) 부채 청산 예상';
  }

  @override
  String get analytics_label_noProjection => '상환 기록을 입력하면 예측이 가능합니다';

  @override
  String get analytics_label_subscriptionVsVariable => '구독 vs 변동 지출';

  @override
  String get settings_title => '설정';

  @override
  String get settings_label_monthlyBudget => '월 예산';

  @override
  String get settings_label_notifications => '결제 알림';

  @override
  String get settings_label_notificationDetail => '결제일 3일 전 알림';

  @override
  String get settings_label_dataExport => '데이터 내보내기';

  @override
  String get settings_button_exportCSV => 'CSV로 내보내기';

  @override
  String get settings_button_resetData => '모든 데이터 초기화';

  @override
  String get settings_label_appVersion => '버전';

  @override
  String get settings_label_privacyPolicy => '개인정보처리방침';

  @override
  String get settings_confirm_reset => '모든 데이터가 영구 삭제됩니다. 진행하시겠습니까?';

  @override
  String get settings_label_language => '언어';

  @override
  String get common_button_save => '저장';

  @override
  String get common_button_cancel => '취소';

  @override
  String get common_button_confirm => '확인';

  @override
  String get common_button_delete => '삭제';

  @override
  String get common_label_loading => '로딩 중...';

  @override
  String get common_label_empty => '데이터가 없습니다';

  @override
  String get common_label_error => '오류가 발생했습니다';

  @override
  String get common_currency_symbol => '₩';

  @override
  String get common_label_perMonth => '/ 월';
}
