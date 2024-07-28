import 'package:c_enam/Features/Chat/Model/chat_model.dart';

class Message {
  final String message;
  final bool isSelf;
  final ChatResultGeneration? food;

  Message({required this.message, required this.isSelf, this.food});
}
