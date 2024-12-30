import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maps",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFA52A2A),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/maps.jpg', // Path gambar lokal Anda
          fit: BoxFit.cover, // Menyesuaikan gambar
          width: 400, // Atur lebar gambar
          height: 500, // Atur tinggi gambar
        ),
      ),
    );
  }
}
