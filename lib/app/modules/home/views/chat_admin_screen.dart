import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/chat_admin_controller.dart';

class ChatAdminScreen extends StatefulWidget {
  const ChatAdminScreen({Key? key}) : super(key: key);

  @override
  State<ChatAdminScreen> createState() => _ChatAdminScreenState();
}

class _ChatAdminScreenState extends State<ChatAdminScreen> {
  final ChatAdminController _chatAdminController = Get.put(ChatAdminController());
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Chat dengan Admin',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFFA52A2A),
        ),
        body: Column(
            children: [
              // Bagian untuk menampilkan pesan chat
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    reverse: true,
                    itemCount: _chatAdminController.messages.length,
                    itemBuilder: (context, index) {
                      final message = _chatAdminController.messages[index];
                      return Align(
                        alignment: message.isFromUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color: message.isFromUser ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            message.content,
                            style: TextStyle(
                              color: message.isFromUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),

              // Bagian untuk mengirim pesan
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Tulis pesan...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.send, color: Color(0xFFA52A2A)),
                      onPressed: () async {
                        if (_messageController.text.isNotEmpty) {
                          // Menyimpan pesan ke Firebase
                          await firebaseFirestore.collection("messages").add({
                            'message': _messageController.text.trim(),
                            'time': Timestamp.now(),
                            'name': auth.currentUser?.displayName ?? 'Pengguna',
                            'isFromUser': true,
                          });
                          _messageController.clear();

                          // Simulasikan respons dari admin
                          Future.delayed(Duration(seconds: 1), () {
                            _chatAdminController.sendMessage(
                              'Pesan diterima, bagaimana saya bisa membantu Anda?',
                              false, // Pesan dari admin
                            );
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
            ),
        );
    }
}