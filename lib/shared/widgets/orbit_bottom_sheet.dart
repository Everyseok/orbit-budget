import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';

class OrbitBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final double? height;

  const OrbitBottomSheet({
    super.key,
    required this.title,
    required this.child,
    this.height,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    double? height,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        builder: (_) =>
            OrbitBottomSheet(title: title, height: height, child: child),
      );

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.85,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.mutedGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(title, style: AppTypography.headlineMedium()),
              const SizedBox(height: 20),
              Expanded(child: child),
            ],
          ),
        ),
      );
}
