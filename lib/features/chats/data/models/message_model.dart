import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/features/chats/domain/entities/message_entity.dart';

class MessageModel extends BaseModel<MessageEntity> {
  final String receiverId;
  final String senderId;
  final String dateTime;
  final String message;

  MessageModel({
    required this.receiverId,
    required this.senderId,
    required this.dateTime,
    required this.message,
  });
  factory MessageModel.fromJson(dynamic json) {
    return MessageModel(
        message: json['message'],
        dateTime: json['dateTime'],
        senderId: json['senderId'],
        receiverId: json['receiverId']);
  }

  @override
  MessageEntity toEntity() {
    return MessageEntity(
        receiverId: receiverId,
        senderId: senderId,
        dateTime: dateTime,
        message: message);
  }
}
