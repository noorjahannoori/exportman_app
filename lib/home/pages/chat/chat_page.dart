import 'package:exportman/home/pages/chat/chat_detail_page.dart';
import 'package:exportman/home/pages/chat/chat_provider.dart';
import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: const Icon(Icons.arrow_back_ios,
         color: Colors.white),
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          /// 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 335,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                     Icon(Icons.search, color: Colors.grey),
              
                  Spacer(),
                   Icon(Icons.mic, color: Colors.grey),
                ],
              ),
            ),
          ),

          /// 📃 CHAT LIST
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (_, __) => const Divider(
                color: Color(0xFFEBEBEB),
                height: 1,
              ),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailPage(chat: chat),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat.image),
                  ),
                  title: Text(chat.name),
                  subtitle: Text(chat.lastMessage),
                  trailing: chat.unreadCount > 0
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.primary,
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        )
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
