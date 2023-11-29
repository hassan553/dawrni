import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/chats/domain/entities/message_entity.dart';
import 'package:dawrni/features/chats/domain/parameters/message_parameters.dart';

abstract class ChatRepository {
  Future<Either<Failure, String>> sendMessage(MessageParameter parameter);
  Future<Either<Failure, List<MessageEntity>>> getMessages(String reciverId);
}
