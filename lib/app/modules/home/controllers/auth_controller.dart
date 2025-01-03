import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes/filled_login_page.dart';
import 'package:flutter_application_1/app/routes/home_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Periksa status login saat controllerdiinisialisasi
  }
  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _prefs.containsKey('user_token');
  }

// Fungsi untuk registrasi pengguna
  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _prefs.setString('user_token', _auth.currentUser!.uid); // Simpan token pengguna
      Get.snackbar('Success', 'Login berhasil',
          backgroundColor: Colors.green);
      isLoggedIn.value = true; // Set status login menjadi true
      Get.offAllNamed('/login');

    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
// Fungsi untuk login pengguna
  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      Get.offAllNamed('/home');
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    _prefs.remove('user_token');
    isLoggedIn.value = false;
    _auth.signOut();
    Get.offAllNamed('/login');
  }
}