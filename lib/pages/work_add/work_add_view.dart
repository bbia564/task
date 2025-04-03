import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:today_work/db_work/work_entity.dart';
import 'package:today_work/main.dart';
import 'package:today_work/pages/work_add/work_text_field.dart';

import 'work_add_logic.dart';

class WorkAddPage extends GetView<WorkAddLogic> {
  Widget _item(int index) {
    return Container(
      height: 35,
      width: 60,
      alignment: Alignment.center,
      child: Text(
        itemTitles[index],
        style: TextStyle(
            color: controller.type == index ? Colors.white : Colors.black),
      ),
    )
        .decorated(
            borderRadius: BorderRadius.circular(8),
            color: controller.type == index
                ? primaryColor
                : const Color(0xfff2f2f2))
        .gestures(onTap: () {
      controller.type = index;
      controller.update();
    });
  }

  Widget _rightWidget(int index) {
    Widget rightWidget = Container();
    if (index == 0 && controller.list.length == 1) {
      rightWidget = Image.asset(
        'assets/add.webp',
        width: 35,
        height: 35,
        fit: BoxFit.cover,
      ).gestures(onTap: () {
        controller.list.add(SubWorkEntity(name: '', done: 0));
        controller.update();
      });
    } else if (index == 0 && controller.list.length > 2) {
      rightWidget = const SizedBox(
        width: 35,
        height: 35,
      );
    } else if (index == controller.list.length - 1) {
      rightWidget = Image.asset(
        'assets/add.webp',
        width: 35,
        height: 35,
        fit: BoxFit.cover,
      ).gestures(onTap: () {
        controller.list.add(SubWorkEntity(name: '', done: 0));
        controller.update();
      });
    } else {
      rightWidget = Image.asset(
        'assets/sub.webp',
        width: 35,
        height: 35,
        fit: BoxFit.cover,
      ).gestures(onTap: () {
        controller.list.removeAt(index);
        controller.update();
      });
    }
    return rightWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: GetBuilder<WorkAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const Text(
                'Task date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [_item(0), _item(1), _item(2), _item(3)],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Task name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 44,
                child: WorkTextField(
                    value: controller.name,
                    maxLength: 20,
                    onChange: (v) {
                      controller.name = v;
                    }),
              ),
              Divider(
                height: 15,
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add subtask',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.list.length,
                  itemBuilder: (_, index) {
                    var entity = controller.list[index];
                    return <Widget>[
                      Expanded(
                          child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: <Widget>[
                          Text('${index + 1}.'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: WorkTextField(
                                  hintText: 'Enter a subtask name',
                                  maxLength: 20,
                                  value: entity.name,
                                  onChange: (v) {
                                    entity.name = v;
                                  }))
                        ].toRow(),
                      ).decorated(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xffdbdbdb)))),
                      const SizedBox(
                        width: 20,
                      ),
                      _rightWidget(index)
                    ].toRow().marginOnly(bottom: 10);
                  }),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: const Text('Add task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              )
                  .decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12))
                  .gestures(onTap: () {
                controller.addData();
              })
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
