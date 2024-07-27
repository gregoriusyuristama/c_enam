import 'package:c_enam/Core/TextStyle/CETextStyle.dart';
import 'package:flutter/material.dart';

import '../../../Core/Colors/CEColors.dart';

class ChipChoice extends StatelessWidget {
  final String choiceText;
  final VoidCallback callback;
  const ChipChoice(
      {super.key, required this.choiceText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 2,
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            border: Border.all(
              color: CEcolors.green,
            )),
        child: Text(
          choiceText,
          style: CETextStyle.chipTextStyle,
        ),
      ),
    );
  }
}
