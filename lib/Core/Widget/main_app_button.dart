// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:task/Core/Extentions/extentions.dart';

import '../Themes/app_colors.dart';

class MainAppButton extends StatelessWidget {
  final Color? bgColor;
  final double? vertical;
  final double? horizontal;
  final Widget child;
  final Function()? onTap;

  const MainAppButton({
    super.key,
    this.bgColor,
    this.vertical,
    this.horizontal,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
              color: AppColors.natural100,
              width: 0.5,
            )),
        child: child,
      ).setHorizontalAndVerticalPadding(
        context,
        vertical ?? 0.0,
        horizontal ?? 0.0,
      ),
    );
  }
}
