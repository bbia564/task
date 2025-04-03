import 'dart:convert';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:today_work/db_work/work_entity.dart';


class DBWork extends GetxService {
  late Database dbBase;

  Future<DBWork> init() async {
    await createWorkDB();
    return this;
  }

  createWorkDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'work.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createWorkTable(db);
        });
  }

  createWorkTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS work (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, name TEXT, list TEXT)');
  }

  insertWork(WorkEntity entity) async {
    final id = await dbBase.insert('work', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'name': entity.name,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateWork(WorkEntity entity) async {
    await dbBase.update('work', {
      'createdTime': entity.createdTime.toIso8601String(),
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanWorkData() async {
    await dbBase.delete('work');
  }

  Future<List<WorkEntity>> getWorkAllData() async {
    var result = await dbBase.query('work', orderBy: 'createdTime DESC');
    return result.map((e) => WorkEntity.fromJson(e)).toList();
  }
}
