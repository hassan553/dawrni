import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/features/chats/presentation/views/chats_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../bloc/chat_get_messages.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  List data = [
    {'receiverId': 'hashem', 'senderId': 'hassan'},
    {'receiverId': 'hassan', 'senderId': 'hashem'}
  ];
  List ids = ['hassan', 'hashem'];
  final searchFocuseNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: CustomTextFieldWidget(
                  focusNode: searchFocuseNode,
                  controller: TextEditingController(),
                  hintText: S.of(context).searchYourMessage,
                  suffixIcons: Image.asset(ImagesPaths.searchIconPng),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    final chat = chatData[index];
                    return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ChatDetailsView(
                                data: data[index], id: ids[index]);
                          }));
                          // context.go(Uri(
                          //     path: ChatsDetailsRoute.name,
                          //     queryParameters: {'id': 'id'}).toString());
                          // // context.push(ChatsDetailsRoute.name);
                        },
                        child: customChatWidget(chat));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: () => FocusScope.of(context).requestFocus(searchFocuseNode),
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
                Text(chat.name, style: context.f14700),
                const SizedBox(height: 3),
                Text(chat.lastMessage, style: context.f10600),
              ],
            ),
          ),
          Column(
            children: [
              Text(chat.time, style: context.f10600),
              const SizedBox(height: 4),
              CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.primaryColor,
                child: Text('3', style: context.f10600),
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
  final String id;

  ChatContact({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.time,
    required this.id,
  });
}

final List<ChatContact> chatData = [
  ChatContact(
    name: 'Hassan',
    imageUrl: 'assets/Rectangle 43.png',
    lastMessage: 'Hello there!',
    time: '10:30 AM',
    id: 'senderId',
  ),
  ChatContact(
    name: 'Hashem',
    imageUrl: 'assets/Rectangle 43.png',
    lastMessage: 'Hello there!',
    time: '10:30 AM',
    id: 'receiverId',
  ),
];
