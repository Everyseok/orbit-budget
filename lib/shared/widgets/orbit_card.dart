import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';

class OrbitCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool glowActive;
  final VoidCallback? onTap;

  const OrbitCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.glowActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: AppColors.panelBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: glowActive
                  ? AppColors.electricBlue
                  : AppColors.blueSubtle,
              width: glowActive ? 1.5 : 1,
            ),
            boxShadow: glowActive ? AppColors.blueGlow : null,
          ),
          child: child,
        ),
      );
}
