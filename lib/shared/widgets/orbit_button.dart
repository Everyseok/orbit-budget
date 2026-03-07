import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';

class OrbitButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;
  final IconData? icon;

  const OrbitButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppColors.blueGlow,
        ),
        child: ElevatedButton.icon(
          onPressed: isLoading ? null : onPressed,
          icon: isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.spaceBlack,
                  ),
                )
              : icon != null
                  ? Icon(icon, size: 16)
                  : const SizedBox.shrink(),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.electricBlue,
          ),
        ),
      );
}
