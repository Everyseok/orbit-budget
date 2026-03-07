import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';

class OrbitTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;
  final int maxLines;

  const OrbitTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        maxLines: maxLines,
        style: GoogleFonts.spaceGrotesk(color: AppColors.white),
        decoration: InputDecoration(labelText: label, hintText: hint),
      );
}
