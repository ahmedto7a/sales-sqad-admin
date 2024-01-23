import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  RxList<types.Message> messages = <types.Message>[].obs;
  final user = types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
  final otherUser = types.User(id: 'other-user');

  void handleSendPressed(types.PartialText message) {
    if (message.text.trim().isNotEmpty) {
      final textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
      );

      final otherTextMessage = types.TextMessage(
        author: otherUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
      );

      messages.insert(0, textMessage);
      messages.insert(0, otherTextMessage);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    // Add dummy messages
    messages.addAll([
      types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: 'Hello!',
      ),
      types.TextMessage(
        author: otherUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: 'Hi there!',
      ),
    ]);
  }
}
