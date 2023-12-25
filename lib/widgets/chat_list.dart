import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watsapp_clone/features/chat/controller/chat_controller.dart';
import 'package:watsapp_clone/widgets/sender_message_card.dart';
import '../info.dart';
import 'my_message_card.dart';

class ChatList extends ConsumerWidget {
  final String recieverUserId;
  const ChatList({Key? key, required this.recieverUserId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<Object>(
        stream: ref.read(chatControllerProvider).chatStream(recieverUserId),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              if (messages[index]['isMe'] == true) {
                return MyMessageCard(
                  message: messages[index]['text'].toString(),
                  date: messages[index]['time'].toString(),
                );
              }
              return SenderMessageCard(
                message: messages[index]['text'].toString(),
                date: messages[index]['time'].toString(),
              );
            },
          );
        });
  }
}
