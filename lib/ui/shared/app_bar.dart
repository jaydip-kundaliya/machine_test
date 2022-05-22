import 'package:flutter/material.dart';
import 'package:machine_test/utils/app_colors.dart';

import '../../utils/app_text_style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  const BaseAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: leading,
      title: Text(
        title,
        style: AppTextStyle.poppins(),
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
