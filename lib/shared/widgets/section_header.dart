import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title.toUpperCase(), style: AppTypography.sectionLabel()),
      );
}
