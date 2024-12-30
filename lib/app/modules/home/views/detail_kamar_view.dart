import 'package:flutter/material.dart';

class DetailKamarScreen extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String points;

  DetailKamarScreen({
    required this.title,
    required this.image,
    required this.price,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Harga: Rp. $price/Hari"),
            Text("Point: $points"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logika untuk melakukan pemesanan bisa ditambahkan di sini
              },
              child: Text("Pesan Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
