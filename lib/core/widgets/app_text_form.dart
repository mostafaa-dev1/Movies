// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/theme/text_styles.dart';

class CustomTextFrom extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? prefixText;
  final String? Function(String)? onChanged;
  final VoidCallback? onTap;

  const CustomTextFrom({
    super.key,
    this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    required this.keyboardType,
    this.prefixText,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(5),
        TextFormField(
          onTap: onTap,
          onChanged: (v) {
            if (onChanged != null) {
              onChanged!(v);
            }
          },
          validator: (value) {
            return validator!(value);
          },
          controller: controller,
          obscureText: obscureText ?? false,
          style: Theme.of(context).textTheme.headlineMedium,
          keyboardType: keyboardType,
          cursorColor: AppColors.redColor,
          decoration: InputDecoration(
            isDense: true,
            enabled: true,
            filled: true,
            fillColor: AppColors.secodaryColor,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.surface),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.redColor, width: 2),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red),
            ),
            prefixText: prefixText,
            suffixIcon: suffixIcon,
            hintText: hintText,
            prefixStyle: Theme.of(context).textTheme.headlineSmall,
            hintStyle:
                AppTextStyles.style13w400g700.copyWith(color: Colors.grey[400]),
          ),
        ),
      ],
    );
  }
}
