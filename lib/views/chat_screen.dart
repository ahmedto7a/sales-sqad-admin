import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../widgets/custom_appbar.dart';

class ChatPage extends StatelessWidget {
  final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Chat',
          leadingIcon: Icons.arrow_back_ios_rounded,
        ),
        body: Chat(
          messages: controller.messages,
          onSendPressed: controller.handleSendPressed,
          user: controller.user,
        ));
  }
}
