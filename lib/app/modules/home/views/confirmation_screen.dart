import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String roomTitle; // Argumen untuk judul kamar

  ConfirmationScreen({required this.roomTitle}); // Konstruktor yang memerlukan argumen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pemesanan'),
      ),
      body: Center(
        child: Text(
          'Anda telah memesan: $roomTitle', // Menampilkan judul kamar yang dipesan
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
