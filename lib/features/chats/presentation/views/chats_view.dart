import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/widgets/custom_sized_box.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CustomSizedBox(value: .03),
            SizedBox(
              height: 40,
              child: CustomTextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Search your message ..',
                suffixIcons: Image.asset('assets/Search.png'),
              ),
            ),
            const CustomSizedBox(value: .04),
            Expanded(
              child: ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return customChatWidget(chat);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          // Open contacts or create a new chat
        },
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }

  Padding customChatWidget(ChatContact chat) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(chat.imageUrl),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  chat.lastMessage,
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                chat.time,
                style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ],
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