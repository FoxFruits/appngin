import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/carousel_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/pesan_sekarang.dart';

import 'package:get/get.dart';

import '../modules/home/views/feedback_screen.dart';
import '../modules/home/views/history_screen.dart';
import '../modules/home/views/maps_sceen.dart';
import '../modules/home/views/topup_screen.dart';

import '../modules/home/views/chat_admin_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController controller = Get.put(homeController());
  // Function to show the settings options
  void _showSettingsOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => HistoryScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Kritik saran'),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => FeedbackScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Maps'),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => MapsScreen());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding:  EdgeInsets.zero,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Text(
                    "Nginep di Wawan",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 10), // Spasi antara setting dan chat icon
                  GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          ChatAdminScreen()); // Arahkan ke halaman chatting dengan admin
                    },
                    child: Icon(
                      Icons.chat_bubble_outline, // Ikon chat bubble
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      _showSettingsOptions(context);
                    },
                    child: Icon(
                      Icons.settings,
                      size: 25,
                      color:  Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Banjarbaru",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Section: Point Nginap
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30), // Tambahkan padding di kedua sisi
                child: Container(
                  width: MediaQuery.of(context).size.width - 60, // Lebar dikurangi padding
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Point Nginap",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "1320",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => TopUpScreen());
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
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_upward,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Section: Pesan Sekarang
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFA52A2A),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tipe Kamar",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Pesansekarang());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Pesan sekarang",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Obx(() => Container(
                    padding: EdgeInsets.all(5),
                    color: const Color.fromARGB(255, 231, 210, 192),
                    height: 250, // Set height for the horizontal list
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        var product = controller.products[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: _buildHorizontalProductCard(product),
                        );
                      },
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA52A2A),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Center(
                        child: Text(
                      'Highlight',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                color: const Color.fromARGB(255, 231, 210, 192),
                height: 320, // Set height for the horizontal list
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: _buildHighlightSection(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildAutoScrollingProductList() {
    return Obx(() => Container(
          height: 250, // Set height for the horizontal list
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildHorizontalProductCard(product),
              );
            },
          ),
        ));
  }

  Widget _buildHorizontalProductCard(Map<String, String> product) {
    return Container(
      width: 160, // Set width for each product card
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 203, 37, 37).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Image.asset(
              product['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product['name']!, style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product['price']!,
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  product['originalPrice']!,
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  product['discount']!,
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product['location']!,
                style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

   Widget _buildHighlightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 300,
          child: ListView(
            children: [
              _buildHighlightCard(),
              _buildHighlightCardTea(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // adjust the radius value as needed
                image: DecorationImage(
                  image: AssetImage('assets/images/room_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text('Pemandangan Indah',textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Nikmati pemandangan alam yang menyejukkan mata dari kamar Anda.', textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightCardTea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // adjust the radius value as needed
                image: DecorationImage(
                  image: AssetImage('assets/images/Tea.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text('Teh dan Kopi Gratis di Pagi dan Sore Hari',textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Nikmati pemandangan alam yang menyejukkan mata dari kamar Anda.', textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
