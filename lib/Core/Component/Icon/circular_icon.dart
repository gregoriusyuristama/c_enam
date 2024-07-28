import 'package:flutter/material.dart';

class CECircularIcon extends StatelessWidget {
  const CECircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = 28,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white.withOpacity(0.2)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: color,
        iconSize: size,
      ),
    );
  }
}
