import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_work/pages/work_first/work_item.dart';

import 'work_records_logic.dart';

class WorkRecordsPage extends GetView<WorkRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed the task'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: Obx(() {
        return WorkItem(controller.list.value,isFirstData: false,).marginAll(15);
      })),
    );
  }
}
