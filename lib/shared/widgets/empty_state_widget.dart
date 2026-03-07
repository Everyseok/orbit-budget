import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onAction;
  final String? actionLabel;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.icon = Icons.satellite_alt_outlined,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 56, color: AppColors.mutedGray),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppTypography.bodyMedium()
                  .copyWith(color: AppColors.mutedGray),
              textAlign: TextAlign.center,
            ),
            if (onAction != null && actionLabel != null) ...[
              const SizedBox(height: 24),
              OrbitButton(label: actionLabel!, onPressed: onAction),
            ],
          ],
        ),
      );
}
