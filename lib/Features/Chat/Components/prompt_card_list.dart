import 'package:c_enam/Features/Chat/Components/prompt_card.dart';
import 'package:flutter/material.dart';

import '../../../Core/Colors/CEColors.dart';
import '../Model/prompt_model.dart';

class PromptCardList extends StatefulWidget {
  final cardItems = [
    PromptModel(
      title: "Health-conscious",
      subtitle: "be consistent, every step counts",
      cardStartColor: CEcolors.redCardStartGradient,
      cardEndColor: CEcolors.redCardEndGradient,
    ),
    PromptModel(
      title: "Moodbooster",
      subtitle: "it's your cheat day, u only live once",
      cardStartColor: CEcolors.greenCardStartGradient,
      cardEndColor: CEcolors.greenCardEndGradient,
    ),
    PromptModel(
      title: "For-sharing",
      subtitle: "For large group, the more the merrier",
      cardStartColor: CEcolors.blueCardStartGradient,
      cardEndColor: CEcolors.blueCardEndGradient,
    ),
    PromptModel(
      title: "Explore me",
      subtitle: "Explore new world, my food my adventure",
      cardStartColor: CEcolors.redCardStartGradient,
      cardEndColor: CEcolors.redCardEndGradient,
    ),
  ];

  final Function(String) callback;
  PromptCardList({super.key, required this.callback});

  @override
  State<PromptCardList> createState() => _PromptCardListState();
}

class _PromptCardListState extends State<PromptCardList> {
  var isCardTapped = false;
  var indexTapped = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.cardItems.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexTapped = index;
                    widget.callback(widget.cardItems[indexTapped].title ?? "");
                  });
                },
                child: PromptCard(
                  title: widget.cardItems[index].title ?? "",
                  subtitle: widget.cardItems[index].subtitle ?? "",
                  cardStartColor: indexTapped == index
                      ? CEcolors.disabledCardStartGradient
                      : widget.cardItems[index].cardStartColor ?? Colors.white,
                  cardEndColor: indexTapped == index
                      ? CEcolors.disabledCardEndGradient
                      : widget.cardItems[index].cardEndColor ?? Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
