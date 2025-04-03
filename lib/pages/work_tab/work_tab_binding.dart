import 'package:get/get.dart';
import 'package:today_work/pages/work_first/work_first_logic.dart';

import '../work_second/work_second_logic.dart';
import 'work_tab_logic.dart';

class WorkTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkTabLogic());
    Get.lazyPut(() => WorkFirstLogic());
    Get.lazyPut(() => WorkSecondLogic());
  }
}
