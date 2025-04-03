import 'dart:convert';

class WorkEntity {
  int id;
  DateTime createdTime;
  int type;
  String name;
  List<SubWorkEntity> list;

  WorkEntity({required this.id, required this.createdTime, required this.type, required this.name, required this.list});

  factory WorkEntity.fromJson(Map<String, dynamic> json) {
    return WorkEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      name: json['name'],
      list: (jsonDecode(json['list']) as List)
          .map((e) => SubWorkEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'name': name,
      'list': jsonEncode(list.map((e) => e.toJson()).toList()),
    };
  }

  bool get isDone {
    return list.every((element) => element.done == 1);
  }

}

class SubWorkEntity {
  String name;
  int done;

  SubWorkEntity({required this.name, required this.done});

  factory SubWorkEntity.fromJson(Map<String, dynamic> json) {
    return SubWorkEntity(
      name: json['name'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'done': done,
    };
  }

}