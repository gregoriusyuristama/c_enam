import 'package:c_enam/Core/Constant/resource_path.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card_list.dart';
import 'package:c_enam/Features/Chat/Components/send_prompt_card.dart';
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
  String? promptText;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Welcome User",
                    style: CETextStyle.regular18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Let's Find your [Lunch]",
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
                  height: 8,
                ),
                promptText == null ? SizedBox() : SendPromptCard(),
              ],
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
                  offset: const Offset(4, 4), // Horizontal and vertical offset
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
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
      ),
    );
  }
}
