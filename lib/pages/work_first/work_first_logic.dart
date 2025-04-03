import 'package:get/get.dart';
import 'package:today_work/db_work/db_work.dart';
import 'package:today_work/db_work/work_entity.dart';

class WorkFirstLogic extends GetxController {

  DBWork dbWork = Get.find();

  List<List<WorkEntity>> list = [[],[],[],[]];

  void getData() async {
    final result = await dbWork.getWorkAllData();
    list = [[],[],[],[]];
    for (var element in result) {
      if(element.type == 0) {
        list[0].add(element);
      } else if(element.type == 1) {
        list[1].add(element);
      } else if(element.type == 2) {
        list[2].add(element);
      } else if(element.type == 3) {
        list[3].add(element);
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
