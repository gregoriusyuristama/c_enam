import 'package:c_enam/Core/TextStyle/CETextStyle.dart';
import 'package:c_enam/Features/Chat/Components/chip_choice.dart';
import 'package:flutter/material.dart';

import '../../../Core/Colors/CEColors.dart';

class SendPromptCard extends StatefulWidget {
  final choices = ["Italian", "Japanese", "Indonesian", "Korean"];
  SendPromptCard({super.key});

  @override
  State<SendPromptCard> createState() => _SendPromptCardState();
}

class _SendPromptCardState extends State<SendPromptCard> {
  String tappableText = "_________";
  bool isShowingChips = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isShowingChips
            ? Container(
                height: 32,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.choices.length,
                  itemBuilder: (context, index) {
                    return ChipChoice(
                      choiceText: widget.choices[index],
                      callback: () {
                        setState(() {
                          tappableText = widget.choices[index];
                        });
                      },
                    );
                  },
                ),
              )
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CEcolors.greyCard,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "I want to eat "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: Baseline(
                              baseline: 24,
                              baselineType: TextBaseline.alphabetic,
                              child: tappableChoice(),
                            ),
                          ),
                          TextSpan(
                              text:
                                  " food. Can you give me food recommendation from my preference. "),
                        ],
                        style: CETextStyle.cardTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CEcolors.green,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        alignment: Alignment.center,
                        child: Text(
                          "Give Me Recommendation",
                          style: CETextStyle.cardTextStyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget tappableChoice() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowingChips = !isShowingChips;
        });
      },
      child: IntrinsicWidth(
        child: Container(
          alignment: Alignment.bottomLeft,
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
              color: CEcolors.greenSecondary,
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
              border: Border.all(
                color: CEcolors.green,
              )),
          child: Text(
            tappableText,
            style: TextStyle(
              color: CEcolors.green,
            ),
          ),
        ),
      ),
    );
  }
}
