// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ORBIT';

  @override
  String get nav_dashboard => 'Mission Control';

  @override
  String get nav_subscriptions => 'Subscriptions';

  @override
  String get nav_expenses => 'Expenses';

  @override
  String get nav_analytics => 'Analytics';

  @override
  String get nav_settings => 'Settings';

  @override
  String get nav_debt => 'Debt Tracker';

  @override
  String get placeholder_stage2 => 'Stage 2: live data will appear here';

  @override
  String get placeholder_stage3 => 'Stage 3: analytics will appear here';

  @override
  String get route_notFound => 'Route not found';

  @override
  String get route_detail_stage2 => 'Detail view — coming in Stage 2';

  @override
  String get dashboard_label_totalDebt => 'Total Debt';

  @override
  String get dashboard_label_monthlyBudget => 'Monthly Budget';

  @override
  String get dashboard_label_todayBurn => 'Today\'s Spend';

  @override
  String get dashboard_label_monthlySubscriptions => 'Monthly Subscriptions';

  @override
  String get dashboard_label_recentTransactions => 'Recent Transactions';

  @override
  String get dashboard_label_debtClearance => 'Debt Clearance';

  @override
  String get dashboard_label_fuelGauge => 'Budget Fuel';

  @override
  String get dashboard_action_manageDebt => 'Manage Debt';

  @override
  String get subscription_title => 'Subscription Command Center';

  @override
  String get subscription_label_active => 'ACTIVE';

  @override
  String get subscription_label_paused => 'PAUSED';

  @override
  String get subscription_label_cancelling => 'CANCELLING';

  @override
  String get subscription_label_nextBilling => 'Next billing';

  @override
  String get subscription_label_monthlyTotal => 'Monthly Total';

  @override
  String subscription_label_activeCount(int count) {
    return '$count active subscriptions';
  }

  @override
  String get subscription_button_manage => 'Manage Subscription →';

  @override
  String get subscription_button_add => 'Add Subscription';

  @override
  String get subscription_action_pause => 'Pause';

  @override
  String get subscription_action_delete => 'Delete';

  @override
  String get subscription_action_resume => 'Resume';

  @override
  String get subscription_error_urlLaunch => 'Cannot open browser';

  @override
  String get expense_title => 'Daily Log';

  @override
  String get expense_label_today => 'Today';

  @override
  String get expense_label_yesterday => 'Yesterday';

  @override
  String get expense_label_dailyTotal => 'Day Total';

  @override
  String get expense_button_add => 'Add Expense';

  @override
  String get expense_action_delete => 'Delete';

  @override
  String get expense_hint_memo => 'Memo (optional)';

  @override
  String get expense_label_category => 'Category';

  @override
  String get expense_label_amount => 'Amount (KRW)';

  @override
  String get category_food => 'Food';

  @override
  String get category_transport => 'Transport';

  @override
  String get category_living => 'Living';

  @override
  String get category_telecom => 'Telecom';

  @override
  String get category_health => 'Health';

  @override
  String get category_other => 'Other';

  @override
  String get debt_title => 'Debt Tracker';

  @override
  String get debt_label_studentLoan => 'Student Loan';

  @override
  String get debt_label_creditCard => 'Credit Card';

  @override
  String get debt_label_currentBalance => 'Current Balance';

  @override
  String get debt_label_startingBalance => 'Starting Balance';

  @override
  String get debt_label_paidOff => 'Paid off';

  @override
  String get debt_label_combinedTotal => 'Total Debt';

  @override
  String get debt_button_logPayment => 'Log Payment';

  @override
  String get debt_label_paymentHistory => 'Payment History';

  @override
  String get analytics_title => 'Mission Report';

  @override
  String get analytics_label_monthlyBreakdown => 'Monthly Breakdown';

  @override
  String get analytics_label_spendingTrend => '30-Day Trend';

  @override
  String get analytics_label_debtProjection => 'Debt Payoff Projection';

  @override
  String analytics_label_projectionResult(int months, String date) {
    return 'At this rate, debt cleared in $months months ($date)';
  }

  @override
  String get analytics_label_noProjection =>
      'Enter payment history to see projection';

  @override
  String get analytics_label_subscriptionVsVariable =>
      'Subscriptions vs Variable';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_label_monthlyBudget => 'Monthly Budget';

  @override
  String get settings_label_notifications => 'Bill Reminders';

  @override
  String get settings_label_notificationDetail => '3 days before billing date';

  @override
  String get settings_label_dataExport => 'Export Data';

  @override
  String get settings_button_exportCSV => 'Export as CSV';

  @override
  String get settings_button_resetData => 'Reset All Data';

  @override
  String get settings_label_appVersion => 'Version';

  @override
  String get settings_label_privacyPolicy => 'Privacy Policy';

  @override
  String get settings_confirm_reset =>
      'This will permanently delete all data. Are you sure?';

  @override
  String get settings_label_language => 'Language';

  @override
  String get common_button_save => 'Save';

  @override
  String get common_button_cancel => 'Cancel';

  @override
  String get common_button_confirm => 'Confirm';

  @override
  String get common_button_delete => 'Delete';

  @override
  String get common_label_loading => 'Loading...';

  @override
  String get common_label_empty => 'Nothing here yet';

  @override
  String get common_label_error => 'Something went wrong';

  @override
  String get common_currency_symbol => '₩';

  @override
  String get common_label_perMonth => '/ month';
}
