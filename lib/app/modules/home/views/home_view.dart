import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../routes/home_pages.dart'; 

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.off(() => HomePage()); 
          },
          child: Icon(Icons.home), // Ikon home di kiri AppBar
        ),
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
