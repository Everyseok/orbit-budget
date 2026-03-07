import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:orbit_budget/core/constants/routes.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.nav_dashboard)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: l10n.dashboard_label_totalDebt),
            const SizedBox(height: 12),
            OrbitCard(
              child: GlowText(
                AppConstants.studentLoanDefault.toKRW(),
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () => context.push(Routes.debt),
              icon: const Icon(Icons.arrow_forward),
              label: Text(l10n.dashboard_action_manageDebt),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.electricBlue,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: EmptyStateWidget(
                message: l10n.placeholder_stage2,
                icon: Icons.radar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
