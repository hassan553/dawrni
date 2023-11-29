part of 'chat_bloc.dart';

class ChatBlocEvent extends Equatable {
  const ChatBlocEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatBlocEvent {
  final MessageParameter parameter;
  const SendMessageEvent(this.parameter);
}

class GetMessagesEvent extends ChatBlocEvent {
  final String receiverId;
  const GetMessagesEvent(this.receiverId);
}
