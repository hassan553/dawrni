import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawrni/features/chats/data/data_source/chat_data_source.dart';
import 'package:dawrni/features/chats/domain/parameters/message_parameters.dart';

import '../models/message_model.dart';

class ChatRemoteDataSourceImp extends ChatDataSource {
  // Future ssendMessage(MessageModel model) async {
  //   await _sendMessage(model, true);
  //   await _sendMessage(model, false);
  // }

  // _sendMessage(MessageModel model, bool isSender) async {
  //   try {

  //     String id = isSender ? model.senderId : model.receiverId;
  //     await FirebaseFirestore.instance
  //         .collection('chats')
  //         .doc(id)
  //         .collection('messages')
  //         .add(model.toJson());
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  //Stream<List<MessageModel>> getAllMessages(String reciverId) async* {
  //   List<MessageModel> messages = [];
  //   try {
  //     FirebaseFirestore.instance
  //         .collection('chats')
  //         .doc(reciverId)
  //         .collection('messages')
  //         .snapshots()
  //         .listen((event) {
  //       event.docs.forEach((element) {
  //         messages.add(MessageModel.fromJson(element.data()));
  //       });
  //     });
  //   } catch (error) {
  //     print(error.toString());
  //   }
  //   yield messages;
  // }

  List<MessageModel> _messages = [];
  @override
  Stream<List<MessageModel>> getMessages(String receiverId) async* {
    final snapshot = await FirebaseFirestore.instance
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .get();
    _messages = [];
    snapshot.docs.forEach((element) {
      final r = MessageModel.fromJson(element.data());
      _messages.add(r);
    });

    yield _messages;
  }

  @override
  Future sendMessage(MessageParameter parameter) async {
    await _sendMessage(parameter, true);
    await _sendMessage(parameter, false);
  }

  _sendMessage(MessageParameter model, bool isSender) async {
    String id = isSender ? model.senderId : model.receiverId;
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(id)
        .collection('messages')
        .add(model.toJson());
  }
}
