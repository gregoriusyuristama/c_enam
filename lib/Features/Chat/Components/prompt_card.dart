import 'package:flutter/material.dart';

class PromptCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color cardColor;
  const PromptCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 108,
      decoration: const BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(
              height: 10,
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
