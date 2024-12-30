import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String content;
  final bool isFromUser;
  final DateTime time;

  ChatMessage({
    required this.content,
    required this.isFromUser,
    required this.time,
  });

  // Fungsi untuk membuat ChatMessage dari data Firebase
  factory ChatMessage.fromFirestore(Map<String, dynamic> data) {
    return ChatMessage(
      content: data['message'] ?? '',
      isFromUser: data['isFromUser'] ?? true,
      time: (data['time'] as Timestamp).toDate(),
    );
  }

  // Fungsi untuk mengubah ChatMessage menjadi format Firebase
  Map<String, dynamic> toFirestore() {
    return {
      'message': content,
      'isFromUser': isFromUser,
      'time': time,
    };
  }
}

class ChatAdminController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  var messages = <ChatMessage>[].obs;

  // Fungsi untuk mengirim pesan
  void sendMessage(String content, bool isFromUser) {
    final message = ChatMessage(
      content: content,
      isFromUser: isFromUser,
      time: DateTime.now(),
    );

    // Menyimpan pesan ke Firebase
    _firebaseFirestore.collection('messages').add(message.toFirestore());
  }

  @override
  void onInit() {
    super.onInit();

    // Mendengarkan perubahan data dari Firebase secara real-time
    _firebaseFirestore
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots()
        .listen((snapshot) {
      messages.value = snapshot.docs
          .map((doc) => ChatMessage.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
      });
    }
}