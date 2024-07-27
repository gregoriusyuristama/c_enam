import 'package:flutter/material.dart';

import '../../../Core/Component/shape/round_container.dart';
import '../../../Core/TextStyle/CETextStyle.dart';

class BadgeService extends StatelessWidget {
  const BadgeService({
    super.key,
    required this.text,
    required this.icon,
    required this.isActive,
  });

  final String text;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CERoundedContainer(
      radius: 40,
      backgroundColor: isActive
          ? const Color(0xFFEEF9F9)
          : Color.fromARGB(255, 241, 241, 241),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style:
                isActive ? CETextStyle.textBadgeActive : CETextStyle.textBadge,
          ),
        ],
      ),
    );
  }
}
