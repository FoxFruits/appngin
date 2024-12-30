import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  // PageController for the carousel

  // Rx variable to observe the current page
  int currentPage = 0;
  late PageController pageController;
  Timer? timer;

  var products = [
    {
      'name': 'Kamar Reguler Single Bed',
      'price': 'Rp 87.500',
      'discount': '50%',
      'originalPrice': 'Rp 175.000',
      'location': 'Banjarbaru',
      'image': 'assets/images/kamar1.png' // Example image
    },
    {
      'name': 'Kamar Reguler Double Bed',
      'price': 'Rp 180.000',
      'discount': '10%',
      'originalPrice': 'Rp 200.000',
      'location': 'Banjarbaru',
      'image': 'assets/images/kamar1.png' // Example image
    },
    {
      'name': 'Kamar AC Single Bed',
      'price': 'Rp 180.000',
      'discount': '10%',
      'originalPrice': 'Rp 200.000',
      'location': 'Banjarbaru',
      'image': 'assets/images/kamar1.png' // Example image
    }
  ].obs;

  void loadInitialProducts() {
    products.addAll([
        {
          'name': 'Kamar Reguler Single Bed',
        'price': 'Rp 87.500',
        'discount': '50%',
        'originalPrice': 'Rp 175.000',
        'location': 'Banjarbaru',
        'image': 'assets/images/kamar1.png' // Example image
    },
        {
        'name': 'Kamar Reguler Double Bed',
        'price': 'Rp 180.000',
        'discount': '10%',
        'originalPrice': 'Rp 200.000',
        'location': 'Banjarbaru',
        'image': 'assets/images/kamar1.png' // Example image
        },
        {
        'name': 'Kamar AC Single Bed',
        'price': 'Rp 180.000',
        'discount': '10%',
        'originalPrice': 'Rp 200.000',
        'location': 'Banjarbaru',
        'image': 'assets/images/kamar1.png' // Example image
        }
    ]);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
        initialPage: 0, viewportFraction: 0.8); // Create PageController
    loadInitialProducts();
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < products.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
