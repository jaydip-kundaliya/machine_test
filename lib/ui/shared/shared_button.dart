import 'package:flutter/material.dart';
import 'package:machine_test/utils/app_colors.dart';
import 'package:machine_test/utils/app_text_style.dart';

class SharedButton {
  static Widget roundedCornerButton({
    required String buttonText,
    double radius = 10,
    Color buttonColor = AppColors.primaryColor,
    Function()? onPress,
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 15,
    ),
  }) =>
      ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          padding: padding,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          buttonText,
          style: AppTextStyle.poppins(),
        ),
      );

  static Widget squareButton({
    required String buttonText,
    Color buttonColor = AppColors.primaryColor,
    Function()? onPress,
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 15,
    ),
  }) =>
      ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          padding: padding,
          elevation: 2,
        ),
        child: Text(
          buttonText,
          style: AppTextStyle.poppins(),
        ),
      );
}
