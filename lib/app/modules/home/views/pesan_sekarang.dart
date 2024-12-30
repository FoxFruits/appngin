import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/home_pages.dart';

class Pesansekarang extends StatelessWidget {
  final List<Map<String, dynamic>> rooms = [
    {
      "title": "Kamar Reguler Single Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Pesan",
      "available": true,
      "price": "175.000",
      "points": "1750"
    },
    {
      "title": "Kamar Reguler Double Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Habis",
      "available": false,
    },
    {
      "title": "Kamar AC Single Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Pesan",
      "available": true,
      "price": "200.000",
      "points": "2000"
    },
    {
      "title": "Kamar AC Double Bed",
      "image": 'assets/images/OIP.jpeg',
      "status": "Habis",
      "available": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA52A2A),
        title: Text('Pesan Sekarang', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Bagian Point Nginap
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Point Nginap",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "1320", 
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/topup'); // Arahkan ke halaman Top Up
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Top Up",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_upward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // List Kamar
          Expanded(
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(room["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room["title"],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Tersedia: ${room['available'] ? 'Ya' : 'Tidak'}"),
                            Text("Terisi: ${room['available'] ? 'Tidak' : 'Ya'}"),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: room["available"]
                            ? () {
                                // Arahkan ke halaman detail kamar dengan RoomType widget
                                Get.to(() => RoomType(
                                  title: room["title"],
                                  image: room["image"],
                                  price: room["price"],
                                  points: room["points"],
                                ));
                              }
                            : null,
                        child: Text(room["status"]),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: room["available"] ? Colors.brown : Colors.grey,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Tentukan index aktif
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAll(() => HomePage());
              break;
            case 1:
              Get.toNamed('/calendar');
              break;
            case 2:
              Get.toNamed('/qr');
              break;
            case 3:
              Get.toNamed('/notifications');
              break;
            case 4:
              Get.toNamed('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QR Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class RoomType extends StatefulWidget {
  final String title;
  final String image;
  final String price;
  final String points;

  RoomType({required this.title, required this.image, required this.price, required this.points});

  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  bool _showPoints = false;
  int _currentPoints = 1000; // Example value, replace with actual point system

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Lihat Point'),
                      onPressed: () {
                        setState(() {
                          _showPoints = !_showPoints;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height - 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildFacilityItem(Icons.ac_unit, '1 Kipas Angin'),
                            _buildFacilityItem(Icons.bathtub, '1 Kamar Mandi'),
                            _buildFacilityItem(Icons.tv, '1 TV'),
                            _buildFacilityItem(Icons.wifi, 'Wi-Fi'),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Kamar tidur sederhana khusus 1 orang',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                      SizedBox(height: 150),
                      SizedBox(
                        height: 210,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildRoomImage('assets/images/image1.jpg'),
                            _buildRoomImage('assets/images/image2.jpg'),
                            _buildRoomImage('assets/images/image3.jpg'),
                            _buildRoomImage('assets/images/image4.jpg'),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('Rp. ${widget.price}/Hari (${widget.points} Point)', style: TextStyle(color: Colors.white),),
                          onPressed: () {
                            // Handle booking
                            print('Booking button pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_showPoints)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(255, 233, 233, 233).withOpacity(0.9),
                height: 50,
                child: Center(
                  child: Text(
                    'Point Nginap: $_currentPoints',
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFacilityItem(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildRoomImage(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 225,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
