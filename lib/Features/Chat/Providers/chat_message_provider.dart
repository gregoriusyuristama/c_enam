import 'package:flutter/material.dart';

import '../Model/message_model.dart';

/// A provider class for managing chat messages.
///
/// This class handles the storage and manipulation of chat messages in a list.
/// It provides methods to append new messages and clear existing messages.
///
/// Example usage:
/// ```dart
/// ChatMessageProvider messageProvider = ChatMessageProvider();
///
/// // Append a new message
/// messageProvider.appendMessage(Message(text: 'Hello!', sender: 'user'));
///
/// // Clear all messages
/// await messageProvider.clearMessages();
/// ```
class ChatMessageProvider with ChangeNotifier {
  /// List of messages stored by the provider.
  List<Message> messages = [];

  /// Appends a new message to the message list.
  ///
  /// The [msg] parameter is the message to be appended.
  appendMessage(Message msg) {
    messages.add(msg);
    notifyListeners();
  }

  /// Clears all messages from the message list.
  ///
  /// This method clears the message list and notifies listeners about the change.
  Future<void> clearMessages() async {
    messages.clear();
    notifyListeners();
  }
}
