import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (isLoading)
            Container(
              color: AppColors.spaceBlack.withValues(alpha: 0.70),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.electricBlue,
                ),
              ),
            ),
        ],
      );
}
