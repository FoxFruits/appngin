import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Up')),
      body: Center(
        child: Text(
          'Silahkan topup',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
