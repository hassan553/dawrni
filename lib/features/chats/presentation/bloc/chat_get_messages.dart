import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/message_model.dart';
import '../../domain/entities/message_entity.dart';

class GetMessagesBloc {
  final _messagesController = StreamController<List<MessageEntity>>();

  Stream<List<MessageEntity>> get messagesStream => _messagesController.stream;

  List<MessageEntity> _messages = [];

  StreamSubscription<QuerySnapshot>? _subscription;

  void getMessages(String receiverId) {
    final collection = FirebaseFirestore.instance
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime');

    _subscription = collection.snapshots().listen((snapshot) {
      _messages = snapshot.docs.reversed.map((doc) {
        final result = MessageModel.fromJson(doc.data());
        return result.toEntity();
      }).toList();

      _messagesController.add(_messages);
    });
  }

  void dispose() {
    _subscription?.cancel();
    _messagesController.close();
  }
}
