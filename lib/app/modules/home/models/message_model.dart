class MessageModel {
  final String content;
  final bool isFromUser;
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.isFromUser,
    required this.timestamp,
  });
}
