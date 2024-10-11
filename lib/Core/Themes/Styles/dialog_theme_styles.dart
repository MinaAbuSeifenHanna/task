import '../../../Core/Themes/Styles/text_theme_styles.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class DialogThemeStyles {
  static DialogTheme dialogTheme = const DialogTheme(
    backgroundColor: AppColors.scaffoldBackgroundColor,
    // double? elevation,
    // Color? shadowColor,
    // Color? surfaceTintColor,
    // ShapeBorder? shape,
    // AlignmentGeometry? alignment,
    // Color? iconColor,
    titleTextStyle: TextThemeStyles.titleLarge,
    contentTextStyle: TextThemeStyles.titleMedium,
    // EdgeInsetsGeometry? actionsPadding,
  );
}
