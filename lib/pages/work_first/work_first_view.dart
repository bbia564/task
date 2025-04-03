import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:today_work/pages/work_first/work_item.dart';

import '../../main.dart';
import 'work_first_logic.dart';

class WorkFirstPage extends StatefulWidget {
  const WorkFirstPage({Key? key}) : super(key: key);

  @override
  State<WorkFirstPage> createState() => _WorkFirstPageState();
}

class _WorkFirstPageState extends State<WorkFirstPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  WorkFirstLogic controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<WorkFirstLogic>(builder: (_) {
          return SafeArea(
              child: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    useMaterial3: true,
                    tabBarTheme:
                        const TabBarTheme(indicatorColor: Colors.transparent)),
                child: TabBar(
                  tabAlignment: TabAlignment.fill,
                  controller: _tabController,
                  dividerColor: Colors.grey.shade300,
                  splashFactory: NoSplash.splashFactory,
                  // labelPadding: EdgeInsets.zero,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      text: itemTitles[0],
                    ),
                    Tab(
                      text: itemTitles[1],
                    ),
                    Tab(
                      text: itemTitles[2],
                    ),
                    Tab(
                      text: itemTitles[3],
                    ),
                  ],
                ),
              ),
            ).marginSymmetric(vertical: 10),
            Expanded(
                child: Container(
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  WorkItem(controller.list[0], refresh: () {
                    controller.getData();
                  }),
                  WorkItem(controller.list[1], refresh: () {
                    controller.getData();
                  }),
                  WorkItem(controller.list[2], refresh: () {
                    controller.getData();
                  }),
                  WorkItem(controller.list[3], refresh: () {
                    controller.getData();
                  }),
                ],
              ),
            ))
          ].toColumn().marginAll(15));
        }));
  }
}
