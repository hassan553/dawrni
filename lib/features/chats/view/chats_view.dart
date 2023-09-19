import 'package:flutter/material.dart';

import '../../../core/rescourcs/app_colors.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          final chat = chatData[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(chat.imageUrl),
            ),
            title: Text(
              chat.name,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              chat.lastMessage,
              style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              chat.time,
              style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              // Navigate to the chat screen for this contact
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          // Open contacts or create a new chat
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}

class ChatContact {
  final String name;
  final String imageUrl;
  final String lastMessage;
  final String time;

  ChatContact({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.time,
  });
}

final List<ChatContact> chatData = [
  ChatContact(
    name: 'Ahmed',
    imageUrl: 'assets/Rectangle 43.png',
    lastMessage: 'Hello there!',
    time: '10:30 AM',
  ),
  ChatContact(
    name: 'Mohamed',
    imageUrl: 'assets/Rectangle 43.png',
    lastMessage: 'Hello there!',
    time: '10:30 AM',
  ),
  ChatContact(
    name: 'Hassan',
    imageUrl: 'assets/Rectangle 43.png',
    lastMessage: 'Hello there!',
    time: '10:30 AM',
  ),
  ChatContact(
    name: 'Hashem',
    imageUrl: 'assets/Rectangle 43.png',
    lastMessage: 'Hello there!',
    time: '10:30 AM',
  ),
];
/*

import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatMessageScreen(),
    );
  }
}

class ChatMessageScreen extends StatefulWidget {
  @override
  _ChatMessageScreenState createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  final List<Message> messages = [
    Message(text: 'Hi there!', isMe: false),
    Message(text: 'Hello!', isMe: true),
    // Add more messages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with John Doe'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: message.isMe ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(),
                  ),
                  // Handle sending messages
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Send the message
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
*/