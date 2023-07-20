import 'package:chat_app/widgets/msg_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages found.'),
          );
        }

        if (chatSnapshots.hasError) {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }

        final loadedMsg = chatSnapshots.data!.docs;

        return ListView.builder(
            padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
            reverse: true,
            itemCount: loadedMsg.length,
            itemBuilder: (context, index) {
              final chatMsg = loadedMsg[index].data();
              final nextChatMsg = index + 1 < loadedMsg.length
                  ? loadedMsg[index + 1].data()
                  : null;

              final currentMsgUserId = chatMsg['userId'];
              final nextMsgUserId =
                  nextChatMsg != null ? nextChatMsg['userId'] : null;

              final nextUserIsSame = nextMsgUserId == currentMsgUserId;

              if (nextUserIsSame) {
                return MessageBubble.next(message: chatMsg['text'], isMe: true);
              }
            }
            // Text(loadedMsg[index].data()['text']),
            );
      },
    );
  }
}
