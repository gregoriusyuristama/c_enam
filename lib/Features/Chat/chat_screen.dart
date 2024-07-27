import 'package:c_enam/Core/Constant/resource_path.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card.dart';
import 'package:c_enam/Features/Chat/Model/prompt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Core/Colors/CEColors.dart';
import '../../Core/TextStyle/CETextStyle.dart';

class ChatScreen extends StatefulWidget {
  static const id = "/chat";

  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  var _textNotEmpty = false;
  final cardItems = [
    PromptModel(
      title: "Cuisine",
      subtitle: "What do you want to eat",
      cardColor: Colors.white,
    ),
    PromptModel(
      title: "Macronutrient",
      subtitle: "Focus on protein, carbs, or fat?",
      cardColor: Colors.red,
    ),
    PromptModel(
      title: "Calories",
      subtitle: "High Calorie",
      cardColor: Colors.blue,
    ),
    PromptModel(
      title: "Food",
      subtitle: "Test Food",
      cardColor: Colors.amberAccent,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _textNotEmpty = _textController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "AI Powered Search",
            style: CETextStyle.titleStyle,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  CEcolors.startGreenGradient,
                  CEcolors.endGreenGradient,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome User"),
                            Text("Are you ready to order"),
                            Text("You can start exploring from this"),
                            SizedBox(
                              height: 108,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cardItems.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      PromptCard(
                                        title: cardItems[index].title ?? "",
                                        subtitle:
                                            cardItems[index].subtitle ?? "",
                                        cardColor: cardItems[index].cardColor ??
                                            Colors.white,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Container(
                                  width: double.infinity,
                                  color: CEcolors.greyCard,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(text: "I want to eat"),
                                            WidgetSpan(
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                    Icons.add_a_photo_rounded),
                                              ),
                                            ),
                                            TextSpan(
                                                text:
                                                    "food. Can you give me food recommendation from my preference. "),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Give Me Recommendation"),
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.3), // Shadow color with opacity
                            offset: const Offset(
                                4, 4), // Horizontal and vertical offset
                            blurRadius: 8, // Blur radius of the shadow
                            spreadRadius: 2, // Spread radius of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: _textController,
                                  decoration: InputDecoration(
                                    hintText: "What do you want to eat?",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 16),
                                  ),
                                ),
                              ),
                              _textNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: IconButton(
                                        style: IconButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          ResourcePath.sendIcon,
                                          colorFilter: ColorFilter.mode(
                                            Colors.white,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ));
  }
}
