import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Admin'),
      ),
      body: Center(
        child: Text(
          'Selamat Datang di Halaman Admin',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
