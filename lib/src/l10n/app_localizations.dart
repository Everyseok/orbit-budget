import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
    Locale('zh')
  ];

  /// App name displayed in MaterialApp title
  ///
  /// In en, this message translates to:
  /// **'ORBIT'**
  String get appTitle;

  /// No description provided for @nav_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Mission Control'**
  String get nav_dashboard;

  /// No description provided for @nav_subscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get nav_subscriptions;

  /// No description provided for @nav_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get nav_expenses;

  /// No description provided for @nav_analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get nav_analytics;

  /// No description provided for @nav_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get nav_settings;

  /// No description provided for @nav_debt.
  ///
  /// In en, this message translates to:
  /// **'Debt Tracker'**
  String get nav_debt;

  /// No description provided for @placeholder_stage2.
  ///
  /// In en, this message translates to:
  /// **'Stage 2: live data will appear here'**
  String get placeholder_stage2;

  /// No description provided for @placeholder_stage3.
  ///
  /// In en, this message translates to:
  /// **'Stage 3: analytics will appear here'**
  String get placeholder_stage3;

  /// No description provided for @route_notFound.
  ///
  /// In en, this message translates to:
  /// **'Route not found'**
  String get route_notFound;

  /// No description provided for @route_detail_stage2.
  ///
  /// In en, this message translates to:
  /// **'Detail view — coming in Stage 2'**
  String get route_detail_stage2;

  /// No description provided for @dashboard_label_totalDebt.
  ///
  /// In en, this message translates to:
  /// **'Total Debt'**
  String get dashboard_label_totalDebt;

  /// No description provided for @dashboard_label_monthlyBudget.
  ///
  /// In en, this message translates to:
  /// **'Monthly Budget'**
  String get dashboard_label_monthlyBudget;

  /// No description provided for @dashboard_label_todayBurn.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Spend'**
  String get dashboard_label_todayBurn;

  /// No description provided for @dashboard_label_monthlySubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Monthly Subscriptions'**
  String get dashboard_label_monthlySubscriptions;

  /// No description provided for @dashboard_label_recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get dashboard_label_recentTransactions;

  /// No description provided for @dashboard_label_debtClearance.
  ///
  /// In en, this message translates to:
  /// **'Debt Clearance'**
  String get dashboard_label_debtClearance;

  /// No description provided for @dashboard_label_fuelGauge.
  ///
  /// In en, this message translates to:
  /// **'Budget Fuel'**
  String get dashboard_label_fuelGauge;

  /// No description provided for @dashboard_action_manageDebt.
  ///
  /// In en, this message translates to:
  /// **'Manage Debt'**
  String get dashboard_action_manageDebt;

  /// No description provided for @subscription_title.
  ///
  /// In en, this message translates to:
  /// **'Subscription Command Center'**
  String get subscription_title;

  /// No description provided for @subscription_label_active.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get subscription_label_active;

  /// No description provided for @subscription_label_paused.
  ///
  /// In en, this message translates to:
  /// **'PAUSED'**
  String get subscription_label_paused;

  /// No description provided for @subscription_label_cancelling.
  ///
  /// In en, this message translates to:
  /// **'CANCELLING'**
  String get subscription_label_cancelling;

  /// No description provided for @subscription_label_nextBilling.
  ///
  /// In en, this message translates to:
  /// **'Next billing'**
  String get subscription_label_nextBilling;

  /// No description provided for @subscription_label_monthlyTotal.
  ///
  /// In en, this message translates to:
  /// **'Monthly Total'**
  String get subscription_label_monthlyTotal;

  /// No description provided for @subscription_label_activeCount.
  ///
  /// In en, this message translates to:
  /// **'{count} active subscriptions'**
  String subscription_label_activeCount(int count);

  /// No description provided for @subscription_button_manage.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscription →'**
  String get subscription_button_manage;

  /// No description provided for @subscription_button_add.
  ///
  /// In en, this message translates to:
  /// **'Add Subscription'**
  String get subscription_button_add;

  /// No description provided for @subscription_action_pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get subscription_action_pause;

  /// No description provided for @subscription_action_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get subscription_action_delete;

  /// No description provided for @subscription_action_resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get subscription_action_resume;

  /// No description provided for @subscription_error_urlLaunch.
  ///
  /// In en, this message translates to:
  /// **'Cannot open browser'**
  String get subscription_error_urlLaunch;

  /// No description provided for @expense_title.
  ///
  /// In en, this message translates to:
  /// **'Daily Log'**
  String get expense_title;

  /// No description provided for @expense_label_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get expense_label_today;

  /// No description provided for @expense_label_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get expense_label_yesterday;

  /// No description provided for @expense_label_dailyTotal.
  ///
  /// In en, this message translates to:
  /// **'Day Total'**
  String get expense_label_dailyTotal;

  /// No description provided for @expense_button_add.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get expense_button_add;

  /// No description provided for @expense_action_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get expense_action_delete;

  /// No description provided for @expense_hint_memo.
  ///
  /// In en, this message translates to:
  /// **'Memo (optional)'**
  String get expense_hint_memo;

  /// No description provided for @expense_label_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get expense_label_category;

  /// No description provided for @expense_label_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount (KRW)'**
  String get expense_label_amount;

  /// No description provided for @category_food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get category_food;

  /// No description provided for @category_transport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get category_transport;

  /// No description provided for @category_living.
  ///
  /// In en, this message translates to:
  /// **'Living'**
  String get category_living;

  /// No description provided for @category_telecom.
  ///
  /// In en, this message translates to:
  /// **'Telecom'**
  String get category_telecom;

  /// No description provided for @category_health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get category_health;

  /// No description provided for @category_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get category_other;

  /// No description provided for @debt_title.
  ///
  /// In en, this message translates to:
  /// **'Debt Tracker'**
  String get debt_title;

  /// No description provided for @debt_label_studentLoan.
  ///
  /// In en, this message translates to:
  /// **'Student Loan'**
  String get debt_label_studentLoan;

  /// No description provided for @debt_label_creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get debt_label_creditCard;

  /// No description provided for @debt_label_currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get debt_label_currentBalance;

  /// No description provided for @debt_label_startingBalance.
  ///
  /// In en, this message translates to:
  /// **'Starting Balance'**
  String get debt_label_startingBalance;

  /// No description provided for @debt_label_paidOff.
  ///
  /// In en, this message translates to:
  /// **'Paid off'**
  String get debt_label_paidOff;

  /// No description provided for @debt_label_combinedTotal.
  ///
  /// In en, this message translates to:
  /// **'Total Debt'**
  String get debt_label_combinedTotal;

  /// No description provided for @debt_button_logPayment.
  ///
  /// In en, this message translates to:
  /// **'Log Payment'**
  String get debt_button_logPayment;

  /// No description provided for @debt_label_paymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get debt_label_paymentHistory;

  /// No description provided for @analytics_title.
  ///
  /// In en, this message translates to:
  /// **'Mission Report'**
  String get analytics_title;

  /// No description provided for @analytics_label_monthlyBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Monthly Breakdown'**
  String get analytics_label_monthlyBreakdown;

  /// No description provided for @analytics_label_spendingTrend.
  ///
  /// In en, this message translates to:
  /// **'30-Day Trend'**
  String get analytics_label_spendingTrend;

  /// No description provided for @analytics_label_debtProjection.
  ///
  /// In en, this message translates to:
  /// **'Debt Payoff Projection'**
  String get analytics_label_debtProjection;

  /// No description provided for @analytics_label_projectionResult.
  ///
  /// In en, this message translates to:
  /// **'At this rate, debt cleared in {months} months ({date})'**
  String analytics_label_projectionResult(int months, String date);

  /// No description provided for @analytics_label_noProjection.
  ///
  /// In en, this message translates to:
  /// **'Enter payment history to see projection'**
  String get analytics_label_noProjection;

  /// No description provided for @analytics_label_subscriptionVsVariable.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions vs Variable'**
  String get analytics_label_subscriptionVsVariable;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_label_monthlyBudget.
  ///
  /// In en, this message translates to:
  /// **'Monthly Budget'**
  String get settings_label_monthlyBudget;

  /// No description provided for @settings_label_notifications.
  ///
  /// In en, this message translates to:
  /// **'Bill Reminders'**
  String get settings_label_notifications;

  /// No description provided for @settings_label_notificationDetail.
  ///
  /// In en, this message translates to:
  /// **'3 days before billing date'**
  String get settings_label_notificationDetail;

  /// No description provided for @settings_label_dataExport.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get settings_label_dataExport;

  /// No description provided for @settings_button_exportCSV.
  ///
  /// In en, this message translates to:
  /// **'Export as CSV'**
  String get settings_button_exportCSV;

  /// No description provided for @settings_button_resetData.
  ///
  /// In en, this message translates to:
  /// **'Reset All Data'**
  String get settings_button_resetData;

  /// No description provided for @settings_label_appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settings_label_appVersion;

  /// No description provided for @settings_label_privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settings_label_privacyPolicy;

  /// No description provided for @settings_confirm_reset.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete all data. Are you sure?'**
  String get settings_confirm_reset;

  /// No description provided for @settings_label_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_label_language;

  /// No description provided for @common_button_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_button_save;

  /// No description provided for @common_button_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_button_cancel;

  /// No description provided for @common_button_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get common_button_confirm;

  /// No description provided for @common_button_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_button_delete;

  /// No description provided for @common_label_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get common_label_loading;

  /// No description provided for @common_label_empty.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get common_label_empty;

  /// No description provided for @common_label_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get common_label_error;

  /// No description provided for @common_currency_symbol.
  ///
  /// In en, this message translates to:
  /// **'₩'**
  String get common_currency_symbol;

  /// No description provided for @common_label_perMonth.
  ///
  /// In en, this message translates to:
  /// **'/ month'**
  String get common_label_perMonth;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
