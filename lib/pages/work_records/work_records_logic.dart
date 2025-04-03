import 'package:get/get.dart';
import 'package:today_work/db_work/db_work.dart';
import 'package:today_work/db_work/work_entity.dart';

class WorkRecordsLogic extends GetxController {

  DBWork dbWork = Get.find();

  var list = <WorkEntity>[].obs;

  void getData() async {
    final result = await dbWork.getWorkAllData();
    list.value = result.where((e) => e.isDone).toList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
