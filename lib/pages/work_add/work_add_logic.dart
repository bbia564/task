import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:today_work/db_work/db_work.dart';
import 'package:today_work/db_work/work_entity.dart';

class WorkAddLogic extends GetxController {

  DBWork dbWork = Get.find();

  int type = 0;
  String name = '';
  List<SubWorkEntity> list = [SubWorkEntity(name: '', done: 0)];

  void addData() async {
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input name');
      return;
    }
    bool noWrite = false;
    for (var item in list) {
      if (item.name.isEmpty) {
        noWrite = true;
        break;
      }
    }
    if (noWrite) {
      Fluttertoast.showToast(msg: 'Please input sub work name');
      return;
    }
    await dbWork.insertWork(WorkEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: type,
      name: name,
      list: list,
    ));
    Fluttertoast.showToast(msg: 'Add success');
    Get.back();
  }


}
