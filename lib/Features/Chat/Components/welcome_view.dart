import 'package:c_enam/Features/Chat/Components/prompt_card_list.dart';
import 'package:c_enam/Features/Chat/Components/send_prompt_card.dart';
import 'package:flutter/material.dart';

import '../../../Core/Colors/CEColors.dart';
import '../../../Core/TextStyle/CETextStyle.dart';

class WelcomeView extends StatefulWidget {
  final Function(String) callback;
  const WelcomeView({super.key, required this.callback});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  String? promptText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            "Welcome Kevin ",
            style: CETextStyle.regular18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            "Let's Find your Meals",
            style: CETextStyle.semiBold21,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            "You can start exploring from this",
            style: CETextStyle.regular14.copyWith(
              color: CEcolors.greyText,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        PromptCardList(
          callback: (String title) {
            setState(() {
              promptText = title;
            });
          },
        ),
        SizedBox(
          height: 16,
        ),
        promptText == null
            ? SizedBox()
            : SendPromptCard(
                callback: (String prompt) {
                  widget.callback(prompt);
                },
              ),
      ],
    );
  }
}
