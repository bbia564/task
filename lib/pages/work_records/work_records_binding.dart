import 'package:get/get.dart';

import 'work_records_logic.dart';

class WorkRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkRecordsLogic());
  }
}
