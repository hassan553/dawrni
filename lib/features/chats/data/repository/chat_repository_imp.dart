import 'package:dartz/dartz.dart';
import 'package:dawrni/core/errors/failure.dart';
import 'package:dawrni/features/chats/data/data_source/chat_data_source.dart';
import 'package:dawrni/features/chats/domain/entities/message_entity.dart';
import 'package:dawrni/features/chats/domain/parameters/message_parameters.dart';
import 'package:dawrni/features/chats/domain/repository/chat_repository.dart';

import '../../../../core/errors/errors_handler.dart';
import '../models/message_model.dart';

class ChatRepositoryImp extends ChatRepository {
  final ChatDataSource chatDataSource;
  ChatRepositoryImp(this.chatDataSource);
  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(
      String reciverId) async {
    try {
      List<MessageEntity> messages = [];
      Stream<List<MessageModel>> res = chatDataSource.getMessages(reciverId);
      await for (List<MessageModel> element in res) {
        for (MessageModel model in element) {
          messages.add(model.toEntity());
        }
      }
      return Right(messages);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, String>> sendMessage(
      MessageParameter parameter) async {
    try {
      await chatDataSource.sendMessage(parameter);
      return const Right('Done Send Message');
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }
}
