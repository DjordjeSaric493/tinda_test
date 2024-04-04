import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int id;
  final int senderId;
  final int recieverId;
  final String message;
  final DateTime dateTime;

  Message(
      {required this.id,
      required this.senderId,
      required this.recieverId,
      required this.message,
      required this.dateTime});

  @override
  // TODO: implement props
  List<Object?> get props => [id, senderId, recieverId, message, dateTime];
}
