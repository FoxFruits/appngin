import 'package:flutter_application_1/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  void login() {
    isLoggedIn.value = true;
    Get.offNamed(AppRoutes.home); // Navigate to home page
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offNamed(AppRoutes.login); // Navigate back to login page
  }
}
