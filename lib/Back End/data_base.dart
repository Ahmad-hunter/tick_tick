import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';

class DataBase {
  static Future<Database> database() async {
    final dataBasePath = await getDatabasesPath();
    return await openDatabase(
      join(dataBasePath, 'db_Manager.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE IF NOT EXISTS $constAssignmentTableName(id integer primary key autoincrement,'
            ' $constAssignmentName TEXT,'
            ' $constAssignmentDate TEXT,'
            ' $constAssignmentCategory TEXT,'
            ' $constAssignmentDescreption TEXT,'
            ' $constAssignmentDone INTEGER)');
        db.execute(
            'CREATE TABLE IF NOT EXISTS $constSubAssignmentTableName(id integer primary key autoincrement,'
            ' $constSubAssignmentName TEXT,'
            ' $constSubAssignmentDate TEXT,'
            ' $constAssignmentId INTEGER,'
            ' $constSubAssignmentDone INTEGER)');
      },
      version: 1,
    );
  }

  static Future addData(String tableName, Map<String, Object> data) async {
    final db = await DataBase.database();
    return db.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> loadAssigments() async {
    final db = await DataBase.database();
    var data = await db.query(constAssignmentTableName);
    return data;
  }

  static Future<List<Map<String, dynamic>>> loadSubAssigments() async {
    final db = await DataBase.database();
    var data = await db.query(constSubAssignmentTableName);
    return data;
  }

  static Future<void> deleteById(
    String table,
    String columnId,
    int id,
  ) async {
    final db = await DataBase.database();
    await db.delete(
      table,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }
}
