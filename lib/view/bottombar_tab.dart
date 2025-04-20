import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/controller/bottombar_controller.dart';

class BottomTabBar extends GetView<BottomBarController> {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController.value,
          onPageChanged: (index) => controller.currentIndex.value = index,
          children: controller.screens,
        ),
        bottomNavigationBar: _buildBottomNavBar(controller),
      ),
    );
  }

  Widget _buildBottomNavBar(BottomBarController controller) {
    return BottomNavigationBar(
      elevation: 0.0,
      currentIndex: controller.currentIndex.value,
      selectedItemColor: Color(0xFF9BB81E),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        controller.changePage(value);
      },
      items: [
        buildNavItem(Icons.home_outlined, 'Home', 0, controller),
        buildNavItem(Icons.list, 'CATEGORY', 1, controller),
        buildNavItem(Icons.handshake, 'CURATE', 2, controller),
        buildNavItem(Icons.flash_on, 'SALE', 3, controller),
        buildNavItem(Icons.more_horiz, 'MORE', 4, controller),
      ],
    );
  }

  BottomNavigationBarItem buildNavItem(
    IconData icon,
    String label,
    int index,
    BottomBarController controller,
  ) {
    final isActive = controller.currentIndex.value == index;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Color(0xFF9BB81E) : Colors.grey),
        ],
      ),
      label: label,
    );
  }
}
