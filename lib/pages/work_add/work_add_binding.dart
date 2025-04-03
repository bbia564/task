import 'package:get/get.dart';

import 'work_add_logic.dart';

class WorkAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkAddLogic());
  }
}
