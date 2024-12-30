import 'package:flutter_application_1/app/routes/admin_page.dart';
import 'package:flutter_application_1/app/routes/login_page.dart';
import 'package:flutter_application_1/app/routes/nav_bar.dart';
import 'package:get/get.dart';
import '../modules/home/views/confirmation_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const admin = '/admin';
  static const confirmation =
      '/confirmation'; // Tambahkan konstanta untuk confirmation

  static final routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => homeNav()),
    GetPage(name: admin, page: () => AdminPage()),
    GetPage(
      name: confirmation,
      page: () {
        // Ambil argumen dari Get.arguments
        final roomTitle = Get.arguments;
        return ConfirmationScreen(roomTitle: roomTitle);
      },
    ),
  ];
}
