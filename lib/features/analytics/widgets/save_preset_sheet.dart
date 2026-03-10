import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/features/analytics/models/graph_preset_model.dart';
import 'package:orbit_budget/features/analytics/providers/analytics_providers.dart';
import 'package:orbit_budget/shared/widgets/orbit_text_field.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SavePresetSheet extends ConsumerWidget {
  const SavePresetSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController();
    final notifier = ref.read(graphPresetNotifierProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(title: l10n.analytics_action_savePreset),
        const SizedBox(height: 12),
        OrbitTextField(
          controller: controller,
          label: l10n.analytics_label_presetName,
          hint: l10n.analytics_hint_presetName,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isEmpty) return;
              await notifier.save(GraphPresetModel(
                id: 0,
                name: name,
                chartType: ChartType.categoryPie,
                dateRange: DateRangeFilter.thisMonth,
                categoryFilter: CategoryType.values.toList(),
                createdAt: DateTime.now(),
              ));
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.analytics_action_savePreset),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
