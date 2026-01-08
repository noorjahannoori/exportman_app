import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, List<ChatItem>>(
  (ref) => ChatNotifier(),
);

class ChatNotifier extends StateNotifier<List<ChatItem>> {
  ChatNotifier()
    : super([
        ChatItem(
          id: '1',
          name: 'Ali',
          lastMessage: 'Hello!',
          unreadCount: 2,
        image: 'assets/images/boy.png',
        ),
        ChatItem(
          id: '2',
          name: 'Ahmed',
          lastMessage: 'How are you?',
          unreadCount: 0,
         image: 'assets/images/boy.png',
        ),
        ChatItem(
          id: '1',
          name: 'Ali',
          lastMessage: 'Hello!',
          unreadCount: 2,
          image: 'assets/images/boy.png',
        ),
        ChatItem(
          id: '2',
          name: 'Ahmed',
          lastMessage: 'How are you?',
          unreadCount: 0,
        image: 'assets/images/boy.png',
        ),
        ChatItem(
          id: '1',
          name: 'Noor',
          lastMessage: 'Hello!',
          unreadCount: 2,
          image: 'assets/images/girl.png',
        ),
        ChatItem(
          id: '2',
          name: 'Ahmed',
          lastMessage: 'How are you?',
          unreadCount: 0,
          image: 'assets/images/boy.png',
        ),
      ]);
}

class ChatItem {
  final String id;
  final String name;
  final String lastMessage;
  final int unreadCount;
  final String image;

  ChatItem({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.unreadCount,
    required this.image,
  });
}
