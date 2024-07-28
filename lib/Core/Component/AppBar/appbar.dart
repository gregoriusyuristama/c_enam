import 'package:c_enam/Utils/device_utils.dart';
import 'package:flutter/material.dart';

import '../../Colors/CEColors.dart';

class CEAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CEAppBar({
    super.key,
    this.title,
    this.action,
  });

  final Widget? title;
  final List<Widget>? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: action,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [CEcolors.startGreenGradient, CEcolors.endGreenGradient],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(CEDeviceUtils.getAppBarHeight() * 1.5);
}
