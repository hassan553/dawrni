import 'package:dawrni/core/entities/base_entity.dart';

class MessageEntity extends BaseEntity {
  final String receiverId;
  final String senderId;
  final String dateTime;
  final String message;
  MessageEntity({
    required this.receiverId,
    required this.senderId,
    required this.dateTime,
    required this.message,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [receiverId, senderId, dateTime, message];
}
