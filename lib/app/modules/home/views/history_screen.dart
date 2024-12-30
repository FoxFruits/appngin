import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  // Data history dummy untuk check-in dan check-out
  final List<Map<String, String>> checkInOutHistory = [
    {
      "date": "01/01/2024",
      "details": "Check-in at Kamar Reguler Single Bed",
    },
    {
      "date": "15/12/2023",
      "details": "Check-out from Kamar AC Double Bed",
    },
    // Add more check-in/check-out entries as needed
  ];

  // Data pembayaran dummy (bisa diganti dengan data dari API atau database lokal)
  final List<Map<String, dynamic>> paymentHistory = [
    {
      'amount': 50000,
      'date': '2024-10-11',
      'description': 'Pembayaran untuk kamar A'
    },
    {
      'amount': 75000,
      'date': '2024-10-10',
      'description': 'Pembayaran untuk kamar B'
    },
    {
      'amount': 120000,
      'date': '2024-10-09',
      'description': 'Pembayaran untuk kamar C'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFA52A2A),
      ),
      body: ListView(
        children: [
          // Section for Check-in/Check-out History
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Riwayat Check-in/Check-out",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(), // Prevent scrolling for inner list
            shrinkWrap: true, // Use only the space needed
            itemCount: checkInOutHistory.length,
            itemBuilder: (context, index) {
              final history = checkInOutHistory[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history["date"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(history["details"]!),
                    ],
                  ),
                ),
              );
            },
          ),

          // Section for Payment History
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Riwayat Pembayaran",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          paymentHistory.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada riwayat pembayaran.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // Prevent scrolling for inner list
                  shrinkWrap: true, // Use only the space needed
                  itemCount: paymentHistory.length,
                  itemBuilder: (context, index) {
                    final payment = paymentHistory[index];
                    return ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('Pembayaran ke-${index + 1}'),
                      subtitle: Text('Jumlah: Rp ${payment['amount']}'),
                      trailing: Text(payment['date']),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Detail Pembayaran'),
                              content: Text(
                                'Deskripsi: ${payment['description']}\nJumlah: Rp ${payment['amount']}\nTanggal: ${payment['date']}',
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Tutup'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
