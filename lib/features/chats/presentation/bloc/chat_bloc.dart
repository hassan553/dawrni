import 'package:bloc/bloc.dart';
import 'package:dawrni/features/chats/domain/entities/message_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/parameters/message_parameters.dart';
import '../../domain/repository/chat_repository.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final ChatRepository chatRepository;
  ChatBlocBloc(this.chatRepository) : super(ChatBlocInitial()) {
    on<SendMessageEvent>(_sendMessage);
    on<GetMessagesEvent>(_getMessages);
  }
  _sendMessage(SendMessageEvent event, emit) async {
    final res = await chatRepository.sendMessage(event.parameter);
    res.fold((l) {
      emit(ChatSendMessageError(l));
    }, (r) {
      emit(ChatSendMessageSuccess());
    });
  }

  List<MessageEntity> messages = [];
  _getMessages(GetMessagesEvent event, emit) async {
    emit(ChatGetMessagesLoading());
    final res = await chatRepository.getMessages(event.receiverId);
    res.fold((l) {
      emit(ChatGetMessagesError(l));
    }, (r) {
      messages = r;
      emit(ChatGetMessagesSuccess());
    });
  }
}
