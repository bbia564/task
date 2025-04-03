import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_work/pages/work_add/work_add_view.dart';
import 'package:today_work/pages/work_first/work_first_logic.dart';
import 'package:today_work/pages/work_first/work_first_view.dart';
import 'package:today_work/pages/work_second/work_second_view.dart';

import '../../main.dart';
import 'work_tab_logic.dart';

class WorkTabPage extends GetView<WorkTabLogic> {
  const WorkTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [const WorkFirstPage(), WorkAddPage(), WorkSecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navWBars()),
    );
  }

  Widget _navWBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, color: Colors.grey.withOpacity(0.6)),
          activeIcon: Icon(Icons.home_filled, color: primaryColor),
          label: 'Record',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: primaryColor,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.6)),
          activeIcon: Icon(Icons.settings, color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/workAdd')?.then((_) {
            WorkFirstLogic firstLogic = Get.find();
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
