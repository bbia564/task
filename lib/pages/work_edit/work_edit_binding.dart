import 'package:get/get.dart';

import 'work_edit_logic.dart';

class WorkEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
