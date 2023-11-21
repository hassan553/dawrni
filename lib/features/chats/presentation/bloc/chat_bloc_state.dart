part of 'chat_bloc.dart';

class ChatBlocState extends Equatable {
  const ChatBlocState();

  @override
  List<Object> get props => [];
}

class ChatBlocInitial extends ChatBlocState {}

class ChatSendMessageSuccess extends ChatBlocState {}

class ChatSendMessageError extends ChatBlocState {
  final Failure error;
  const ChatSendMessageError(this.error);
}

class ChatGetMessagesSuccess extends ChatBlocState {}


class ChatGetMessagesError extends ChatBlocState {
  final Failure error;
  const ChatGetMessagesError(this.error);
}

class ChatGetMessagesLoading extends ChatBlocState {}
