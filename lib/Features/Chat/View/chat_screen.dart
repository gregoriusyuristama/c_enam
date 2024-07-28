import 'package:c_enam/Core/Component/shape/round_container.dart';
import 'package:c_enam/Core/Constant/resource_path.dart';
import 'package:c_enam/Core/Utilities/gemini_utilities.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card.dart';
import 'package:c_enam/Features/Chat/Components/prompt_card_list.dart';
import 'package:c_enam/Features/Chat/Components/send_prompt_card.dart';
import 'package:c_enam/Features/Chat/Components/welcome_view.dart';
import 'package:c_enam/Features/Chat/Controller/merchant_controller.dart';
import 'package:c_enam/Features/Chat/Model/merchant_model.dart';
import 'package:c_enam/Features/Chat/Model/message_model.dart';
import 'package:c_enam/Features/Chat/Model/prompt_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Core/Colors/CEColors.dart';
import '../../../Core/TextStyle/CETextStyle.dart';
import '../Components/card_food.dart';
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

  bool isLoading = false;
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
            child: Consumer<ChatMessageProvider>(
              builder: (context, value, child) => value.messages.isEmpty
                  ? WelcomeView(
                      callback: (String prompt) async {
                        messageProvider?.appendMessage(
                          Message(message: prompt, isSelf: true),
                        );
                        isLoading = true;
                        RespMerchants resp =
                            await MerchantController.fetchMerchants();
                        String answer = await GeminiUtilites.shared.askFood(
                          prompt,
                          resp.data ?? [],
                        );
                        isLoading = false;
                        messageProvider?.appendMessage(
                            Message(message: answer, isSelf: false));
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.messages.length,
                      itemBuilder: (context, index) {
                        return chatContainer(value, index);
                      },
                    ),
            ),
          ),
          isLoading
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: CircularProgressIndicator.adaptive(),
                )
              : SizedBox(),
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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
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
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(width: 0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              onPressed: () async {
                                String prompt = _textController.text;
                                messageProvider?.appendMessage(
                                  Message(
                                    message: _textController.text,
                                    isSelf: true,
                                  ),
                                );
                                _textController.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                                isLoading = true;
                                RespMerchants resp =
                                    await MerchantController.fetchMerchants();
                                String answer =
                                    await GeminiUtilites.shared.askFood(
                                  prompt,
                                  resp.data ?? [],
                                );
                                isLoading = false;
                                messageProvider?.appendMessage(
                                  Message(
                                    message: answer,
                                    isSelf: false,
                                  ),
                                );
                              },
                              icon: SvgPicture.asset(
                                ResourcePath.sendIcon,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatContainer(ChatMessageProvider value, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (value.messages[index].isSelf) const Spacer(),
              if (!value.messages[index].isSelf)
                ClipOval(
                  child: Container(
                    padding: const EdgeInsets.only(
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
                      margin: const EdgeInsets.only(
                        left: 8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: value.messages[index].isSelf
                            ? CEcolors.greyCard
                            : CEcolors.greenChatCard,
                        borderRadius: value.messages[index].isSelf
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )
                            : const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
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
        ),
      ],
    );
  }
}
