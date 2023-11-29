import 'package:dawrni/features/chats/data/models/message_model.dart';
import 'package:dawrni/features/chats/domain/parameters/message_parameters.dart';

abstract class ChatDataSource {
  Future sendMessage(MessageParameter parameter);
  Stream<List<MessageModel>> getMessages(String receiverId );
}
