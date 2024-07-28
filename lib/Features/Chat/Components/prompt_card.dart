import 'package:c_enam/Core/TextStyle/CETextStyle.dart';
import 'package:flutter/material.dart';

class PromptCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color cardStartColor;
  final Color cardEndColor;
  const PromptCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.cardStartColor,
    required this.cardEndColor,
  });

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.cardStartColor, widget.cardEndColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: CETextStyle.semiBold16,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.subtitle,
              style: CETextStyle.regular12,
            ),
          ],
        ),
      ),
    );
  }
}
