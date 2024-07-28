import 'package:c_enam/Features/Chat/Providers/chat_message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Application/c_enam_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ChatMessageProvider>(
      create: (context) => ChatMessageProvider(),
      child: const CEnamApp(),
    ),
  );
}
