import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/features/chats/presentation/bloc/chat_bloc.dart';
import 'package:dawrni/features/chats/presentation/widgets/loading_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_compoent/show_toast.dart';
import '../../domain/parameters/message_parameters.dart';
import '../widgets/empty_chat_widget.dart';

class ChatDetailsView extends StatefulWidget {
  final Map data;
  final String id;
  const ChatDetailsView({super.key, required this.data, required this.id});

  @override
  _ChatDetailsViewState createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // void scrollToLastMessage() {
  //   _scrollController.animateTo(
  //     _scrollController.position.maxScrollExtent,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeOut,
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatBlocBloc>().add(GetMessagesEvent(widget.data['senderId']));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data['receiverId']),
      ),
      body: BlocConsumer<ChatBlocBloc, ChatBlocState>(
        listener: (BuildContext context, ChatBlocState state) {
          if (state is ChatSendMessageError) {
            showToast(message: state.error.message);
          }
          if (state is ChatGetMessagesError) {
            showToast(message: state.error.message);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  if (state is ChatGetMessagesLoading) {
                    return const LoadingChatWidget();
                  } else if (context.read<ChatBlocBloc>().messages.isEmpty) {
                    return const EmptyChatWidget();
                  } else {
                    final messages = context.read<ChatBlocBloc>().messages;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Align(
                                  alignment:
                                      messages[index].senderId == widget.id
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: Container(
                                    padding:
                                        const EdgeInsetsDirectional.all(10.0),
                                    decoration: BoxDecoration(
                                      color:
                                          messages[index].senderId == widget.id
                                              ? AppColors.primaryColor
                                              : Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      messages[index].message,
                                      style: context.f16500,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                }),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20, vertical: 30),
                child: CustomTextFieldWidget(
                    suffixIcons: InkWell(
                        onTap: () {
                          if (messageController.text.isNotEmpty) {
                            _sendMessage(context);
                            // scrollToLastMessage();
                            messageController.clear();
                          }
                        },
                        child: const Icon(Icons.send,
                            color: AppColors.primaryColor)),
                    controller: messageController,
                    hintText: 'write your message ...'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    context.read<ChatBlocBloc>().add(SendMessageEvent(MessageParameter(
        receiverId: widget.data['receiverId'],
        senderId: widget.id,
        dateTime: DateTime.now().toString(),
        message: messageController.text)));
        
    context.read<ChatBlocBloc>().add(GetMessagesEvent(widget.id));
  }
}
