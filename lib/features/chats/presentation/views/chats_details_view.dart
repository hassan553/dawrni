import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/widgets/custom_text_filed.dart';
import 'package:dawrni/features/chats/presentation/bloc/chat_bloc.dart';
import 'package:dawrni/features/chats/presentation/widgets/loading_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_compoent/show_toast.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/parameters/message_parameters.dart';
import '../bloc/chat_get_messages.dart';
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
  final GetMessagesBloc _messagesBloc = GetMessagesBloc();

  @override
  void initState() {
    super.initState();
    _messagesBloc.getMessages(widget.id);
  }

  @override
  void dispose() {
    _messagesBloc.dispose();
    messageController.dispose();
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
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: StreamBuilder<List<MessageEntity>>(
                  stream: _messagesBloc.messagesStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final messages = snapshot.data!;
                      if (messages.isEmpty) {
                        return const EmptyChatWidget();
                      }
                      return Scrollbar(
                        child: ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Align(
                                alignment: messages[index].senderId == widget.id
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  padding:
                                      const EdgeInsetsDirectional.all(10.0),
                                  decoration: BoxDecoration(
                                    color: messages[index].senderId == widget.id
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
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const LoadingChatWidget();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20, vertical: 30),
                child: CustomTextFieldWidget(
                    onfiledSumbitted: (p0) {
                      if (messageController.text.isNotEmpty) {
                        _sendMessage(context);
                        messageController.clear();
                      }
                    },
                    suffixIcons: InkWell(
                        onTap: () {
                          if (messageController.text.isNotEmpty) {
                            _sendMessage(context);
                            messageController.clear();
                          }
                        },
                        child: const Icon(Icons.send,
                            color: AppColors.primaryColor)),
                    controller: messageController,
                    hintText: S.of(context).writeYourMessage),
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
  }
}
