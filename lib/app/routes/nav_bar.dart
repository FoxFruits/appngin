import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/Scanqr_screen.dart';
import 'package:flutter_application_1/app/modules/home/views/calender_screen.dart';
import 'package:flutter_application_1/app/modules/home/views/notification_screen.dart';
import 'package:flutter_application_1/app/modules/home/views/profile_screen.dart';
import 'package:flutter_application_1/app/routes/home_pages.dart';
import 'package:get/get.dart';

class homeNav extends GetView {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  homeNav({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.brown,
            unselectedItemColor: const Color.fromARGB(255, 219, 217, 217),
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25.0,
                  color: landingPageController.tabIndex.value == 0
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                label: 'Home',
                backgroundColor: Color(0xFFA52A2A),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today,
                  size: 25.0,
                  color: landingPageController.tabIndex.value == 1
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                label: 'Kalender',
                backgroundColor: Color(0xFFA52A2A),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 25.0,
                  color: landingPageController.tabIndex.value == 2
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                label: 'QR Code',
                backgroundColor: Color(0xFFA52A2A),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 25.0,
                  color: landingPageController.tabIndex.value == 3
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                label: 'Notification',
                backgroundColor: Color(0xFFA52A2A),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25.0,
                  color: landingPageController.tabIndex.value == 4
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                label: 'Account',
                backgroundColor: Color(0xFFA52A2A),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController landingPageController =
        Get.put(HomeController(), permanent: false);
    return WillPopScope(
      onWillPop: () async {
        if (landingPageController.tabIndex.value > 0) {
          landingPageController.changeTabIndex(landingPageController.tabIndex.value - 1);
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar:
              buildBottomNavigationMenu(context, landingPageController),
          body: Obx(() => IndexedStack(
                index: landingPageController.tabIndex.value,
                children: [
                  HomePage(),
                  CalendarScreen(),
                  ScanQRScreen(),
                  NotificationScreen (),
                  ProfileScreen()
                ],
              )),
        ),
      ),
    );
  }
}