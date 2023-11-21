import 'package:equatable/equatable.dart';

class MessageParameter extends Equatable{
  final String receiverId;
  final String senderId;
  final String dateTime;
  final String message;

 const  MessageParameter({
    required this.receiverId,
    required this.senderId,
    required this.dateTime,
    required this.message,
  });
   Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'message': message,
      'dateTime': dateTime,
      'receiverId': receiverId,
    };
  }
   @override
  // TODO: implement props
  List<Object?> get props => [receiverId, senderId, dateTime, message];
}