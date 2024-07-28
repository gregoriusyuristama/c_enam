import 'package:c_enam/Core/Constant/resource_path.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card_list.dart';
import 'package:c_enam/Features/Chat/Components/send_prompt_card.dart';
import 'package:c_enam/Features/Chat/Components/welcome_view.dart';
import 'package:c_enam/Features/Chat/Model/message_model.dart';
import 'package:c_enam/Features/Chat/Model/prompt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Core/Colors/CEColors.dart';
import '../../../Core/TextStyle/CETextStyle.dart';
import '../Providers/chat_message_provider.dart';

class ChatScreen extends StatefulWidget {
  static const id = "/chat";

  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatMessageProvider? messageProvider;
  final _textController = TextEditingController();
  var _textNotEmpty = false;

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
    messageProvider = Provider.of<ChatMessageProvider>(context, listen: true);
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
          Flexible(
            child: SingleChildScrollView(
              child: Consumer<ChatMessageProvider>(
                builder: (context, value, child) => value.messages.isEmpty
                    ? WelcomeView()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.messages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (value.messages[index].isSelf)
                                  const Spacer(),
                                if (!value.messages[index].isSelf)
                                  ClipOval(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 16,
                                        right: 16,
                                      ),
                                      width: 20,
                                      height: 20,
                                      color: CEcolors.green,
                                    ),
                                  ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 8,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: value.messages[index].isSelf
                                              ? CEcolors.greyCard
                                              : CEcolors.greenChatCard,
                                          borderRadius: value
                                                  .messages[index].isSelf
                                              ? BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                )
                                              : BorderRadius.only(
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                ),
                                        ),
                                        child: Text(
                                          value.messages[index].message,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
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
                              onPressed: () {
                                messageProvider?.appendMessage(
                                  Message(
                                    message: _textController.text,
                                    isSelf: true,
                                  ),
                                );
                                _textController.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
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
