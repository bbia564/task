import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:today_work/db_work/db_work.dart';
import 'package:today_work/db_work/work_entity.dart';
import 'package:today_work/main.dart';

class WorkItem extends StatefulWidget {
  WorkItem(this.list, {this.isFirstData = true, this.refresh, Key? key})
      : super(key: key);
  List<WorkEntity> list;
  bool isFirstData;
  VoidCallback? refresh;

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem>
    with AutomaticKeepAliveClientMixin {
  DBWork dbWork = Get.find();

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Visibility(
        visible: widget.isFirstData,
        child: <Widget>[
          RichText(
            text: TextSpan(
                text: 'Total tasks: ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
                children: [
                  TextSpan(
                      text: '${widget.list.length}',
                      style: TextStyle(color: primaryColor))
                ]),
          )
        ].toRow().marginSymmetric(vertical: 15),
      ),
      Expanded(child: widget.list.isEmpty
          ? const Center(
        child: Text('No data'),
      )
          : ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (_, index) {
            var entity = widget.list[index];
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                <Widget>[
                  Image.asset(
                    'assets/icon.webp',
                    width: 18,
                    height: 18,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                        entity.name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                            decorationThickness: 4,
                            decorationColor:
                            entity.isDone ? primaryColor : Colors.yellow),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IgnorePointer(
                    ignoring: !widget.isFirstData,
                    child: Image.asset(
                      'assets/${entity.isDone ? 'selected' : 'unselect'}.webp',
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ).gestures(onTap: () async {
                      if (entity.isDone) {
                        for (var item in entity.list) {
                          item.done = 0;
                        }
                      } else {
                        for (var item in entity.list) {
                          item.done = 1;
                        }
                      }

                      await dbWork.updateWork(entity);
                      widget.refresh?.call();
                    }),
                  ),
                ].toRow(),
                Divider(
                  height: 25,
                  color: Colors.grey.shade300,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: entity.list.length,
                    itemBuilder: (_, index) {
                      var item = entity.list[index];
                      return <Widget>[
                        <Widget>[
                          Expanded(
                              child: Text(
                                '${index + 1}. ${item.name}',
                                style: TextStyle(
                                    color: widget.isFirstData
                                        ? (item.done == 0
                                        ? Colors.black
                                        : Colors.grey)
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decoration: widget.isFirstData
                                        ? (item.done == 0
                                        ? TextDecoration.none
                                        : TextDecoration.lineThrough)
                                        : TextDecoration.none,
                                    decorationColor: item.done == 0
                                        ? Colors.black
                                        : Colors.grey),
                              )),
                          Visibility(
                              visible: widget.isFirstData,
                              child: const SizedBox(
                                width: 10,
                              )),
                          Visibility(
                              visible: widget.isFirstData,
                              child: Image.asset(
                                'assets/${item.done == 1 ? 'selected' : 'unselect'}.webp',
                                width: 16,
                                height: 16,
                                fit: BoxFit.cover,
                              ).gestures(onTap: () {
                                item.done = item.done == 0 ? 1 : 0;
                                dbWork.updateWork(entity);
                                widget.refresh?.call();
                              })),
                        ].toRow(),
                        Visibility(
                            visible: index != entity.list.length - 1,
                            child: Divider(
                              height: 25,
                              color: Colors.grey.shade300,
                            ))
                      ].toColumn();
                    })
              ].toColumn(),
            )
                .decorated(
                color: widget.isFirstData
                    ? const Color(0xfff8f8f8)
                    : Colors.white,
                borderRadius:
                const BorderRadius.all(Radius.circular(6)))
                .marginOnly(bottom: 10);
          }))
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
  }

  @override
  bool get wantKeepAlive => true;
}
