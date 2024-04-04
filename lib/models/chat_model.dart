import 'package:equatable/equatable.dart';
import 'package:tinda_test/models/message_model.dart';

class Chat extends Equatable {
  final int id;
  final int senderUserId;
  final int recieverUserId;
  final List<Message> messages;

  Chat(
      {required this.id,
      required this.senderUserId,
      required this.recieverUserId,
      required this.messages});

  @override
  // TODO: implement props
  List<Object?> get props => [id, senderUserId, recieverUserId, messages];
}
