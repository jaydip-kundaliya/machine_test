import 'package:flutter/material.dart';

class SharedButton {
  static Widget roundedCornerButton({
    required Widget child,
    double radius = 50,
    Color borderColor = const Color(0xFF50CD8D),
    Function()? onPress,
  }) =>
      ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFFFFFF),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: borderColor,
            ),
          ),
        ),
        child: child,
      );

  static Widget circularButtonWithIcon(IconData icon) => Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xFF50CD8D),
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF151522),
        ),
      );
}
