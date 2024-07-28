import 'package:c_enam/Core/TextStyle/CETextStyle.dart';
import 'package:c_enam/Core/Utilities/gemini_utilities.dart';
import 'package:c_enam/Features/Chat/Components/chip_choice.dart';
import 'package:c_enam/Features/Chat/Controller/merchant_controller.dart';
import 'package:c_enam/Features/Chat/Model/merchant_model.dart';
import 'package:c_enam/Features/Chat/Model/message_model.dart';
import 'package:c_enam/Features/Chat/Providers/chat_message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Colors/CEColors.dart';

class SendPromptCard extends StatefulWidget {
  final choices = ["Italian", "Japanese", "Indonesian", "Korean"];
  final Function(String) callback;
  final allChoices = [
    ["Fat-Loss", "Low-Sugar", "Bulking"],
    ["Carbs", "Protein", "Fat", "Fibers"],
    ["Low", "Moderate", "High"],
  ];

  SendPromptCard({super.key, required this.callback});

  @override
  State<SendPromptCard> createState() => _SendPromptCardState();
}

class _SendPromptCardState extends State<SendPromptCard> {
  ChatMessageProvider? messageProvider;
  String firstTappableText = "_________";
  String secondTappableText = "_________";
  String thirdTappableText = "_________";
  bool isShowingChips = false;
  int tappedIndex = -1;
  @override
  Widget build(BuildContext context) {
    messageProvider = Provider.of<ChatMessageProvider>(context);
    return Column(
      children: [
        isShowingChips && tappedIndex != -1
            ? generateChips(widget.allChoices[tappedIndex])
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
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
                          TextSpan(text: "I’m currently on a "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: Baseline(
                              baseline: 24,
                              baselineType: TextBaseline.alphabetic,
                              child: tappableChoice(0),
                            ),
                          ),
                          const TextSpan(
                              text: " diet. I need food that is high in "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: Baseline(
                              baseline: 24,
                              baselineType: TextBaseline.alphabetic,
                              child: tappableChoice(1),
                            ),
                          ),
                          TextSpan(text: "with "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: Baseline(
                              baseline: 24,
                              baselineType: TextBaseline.alphabetic,
                              child: tappableChoice(2),
                            ),
                          ),
                          TextSpan(
                              text:
                                  " in calories. It would be awesome if you could find something that can be delivered quickly and includes the best deals from my vouchers.")
                        ],
                        style: CETextStyle.cardTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String prompt =
                            "I’m currently on a ${firstTappableText} diet. I need food that is high in ${secondTappableText} with ${thirdTappableText} in calories. It would be awesome if you could find something that can be delivered quickly and includes the best deals from my vouchers.";

                        widget.callback(prompt);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CEcolors.green,
                        shape: const RoundedRectangleBorder(
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

  Container generateChips(List<String> choices) {
    return Container(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.allChoices[tappedIndex].length,
        itemBuilder: (context, index) {
          return ChipChoice(
            choiceText: widget.allChoices[tappedIndex][index],
            callback: () {
              setState(() {
                if (tappedIndex == 0) {
                  firstTappableText = widget.allChoices[tappedIndex][index];
                } else if (tappedIndex == 1) {
                  secondTappableText = widget.allChoices[tappedIndex][index];
                } else if (tappedIndex == 2) {
                  thirdTappableText = widget.allChoices[tappedIndex][index];
                }
                isShowingChips = !isShowingChips;
              });
            },
          );
        },
      ),
    );
  }

  Widget tappableChoice(int tappedIndex) {
    String tapText = "";
    switch (tappedIndex) {
      case 0:
        tapText = firstTappableText;
      case 1:
        tapText = secondTappableText;
      case 2:
        tapText = thirdTappableText;
      default:
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowingChips = !isShowingChips;
          this.tappedIndex = tappedIndex;
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
            tapText,
            style: TextStyle(
              color: CEcolors.green,
            ),
          ),
        ),
      ),
    );
  }
}
