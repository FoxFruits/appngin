import 'package:get/get.dart';

class PesananController extends GetxController {

  var isOrdered = false.obs;

  void orderRoom() {
    isOrdered.value = true;
    Get.toNamed('/confirmation');  // Arahkan ke halaman konfirmasi setelah memesan
  }
}
