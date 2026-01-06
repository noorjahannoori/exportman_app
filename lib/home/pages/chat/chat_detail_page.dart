import 'package:exportman/home/pages/chat/chat_provider.dart';
import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final ChatItem chat;
  const ChatDetailPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(chat.name, style: const TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.more_vert,
          color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: Stack(
        children: [
          /// 🌄 BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset('assets/images/chat.png', fit: BoxFit.cover),
          ),

          /// 💬 MESSAGES
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _messageBubble(text: 'Hello', isMe: false),
                    _messageBubble(
                      text: 'Hi! How are you?',
                      isMe: true,
                      read: true,
                    ),
                    _messageBubble(text: 'Hello', isMe: false),
                    _messageBubble(
                      text: 'Hi! How are you?',
                      isMe: true,
                      read: true,
                    ),
                    _messageBubble(text: 'Hello', isMe: false),
                    _messageBubble(
                      text: 'Hi! How are you?',
                      isMe: true,
                      read: true,
                    ),
                  ],
                ),
              ),

              /// ✍ INPUT
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Type message...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.send, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _messageBubble({
    required String text,
    required bool isMe,
    bool read = false,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
            if (isMe)
              Text(
                read ? 'Read' : 'Sent',
                style: const TextStyle(fontSize: 10, color: Colors.white70),
              ),
          ],
        ),
      ),
    );
  }
}
