import 'dart:async';
import 'package:pokedex/model/JsonQuestionModel.dart';
import 'package:pokedex/model/JsonUserModel.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBProvider {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("CREATE TABLE Question("
        "QuestionID TEXT,"
        "QuestionName TEXT,"
        "AnswerResult TEXT,"
        "UserID TEXT,"
        "QuestionType INTEGQER"
        ")");
    await database.execute("CREATE TABLE User("
        "UserName TEXT,"
        "Password TEXT,"
        "UserID TEXT"
        ")");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("dbtest.db", version: 1, onCreate: (db, version) async {
      await createTable(db);
    });
  }

  static Future<int> createItem(String? QuestionID, String AnswerResult) async {
    final db = await DBProvider.db();

    final data = {'QuestionID': QuestionID, 'AnswerResult': QuestionID};
    final id = await db.insert('Question', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<JsonQuestionModel>> getQuestions() async {
    final db = await DBProvider.db();
    var data = await db.query('Question', orderBy: "QuestionID");
    List<JsonQuestionModel> list;
    if (data.isNotEmpty) {
      list = data.map((c) => JsonQuestionModel.fromMap(c)).toList();
    } else {
      list = [];
    }
    return list;
  }

  static Future<List<JsonQuestionModel>> getQuestion(String? id) async {
    final db = await DBProvider.db();
    var data = await db.query('Question', where: "QuestionID = ?", whereArgs: [id], limit: 1);
    List<JsonQuestionModel> list;
    if (data.isNotEmpty) {
      list = data.map((c) => JsonQuestionModel.fromMap(c)).toList();
    } else {
      list = [];
    }
    return list;
  }

  static Future<int> updateItem(String? QuestionID, String AnswerResult) async {
    final db = await DBProvider.db();
    final exist = await DBProvider.getQuestion(QuestionID);
    var result;
    print(AnswerResult);
    if (exist.isNotEmpty) {
      final data = {
        'AnswerResult': AnswerResult,
      };
      result = await db.update('Question', data, where: "QuestionID = ?", whereArgs: [QuestionID]);
    } else {
      result = await DBProvider.createItem(QuestionID, AnswerResult);
    }

    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DBProvider.db();
    await db.delete("Question", where: "QuestionID = ?", whereArgs: [id]);
  }

  static Future<void> CreateOfUpadateUser(String UserName, String Password) async {
    final db = await DBProvider.db();
    final exist = await db.query('User', where: "UserName = ?", whereArgs: [UserName], limit: 1);
    if (exist.isNotEmpty) {
      final data = {
        'Password': Password,
      };
      await db.update('User', data, where: "UserName = ?", whereArgs: [UserName]);
    } else {
      final dataCreate = {'UserName': UserName, 'Password': Password};
      await db.insert('User', dataCreate, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
  }

  static Future<List<JsonUserModel>> getUser(String? UserName, String? Password) async {
    final db = await DBProvider.db();
    var data = await db.query('User',
        where: "UserName = ? AND Password=?", whereArgs: [UserName, Password], limit: 1);
    List<JsonUserModel> list;
    if (data.isNotEmpty) {
      list = data.map((c) => JsonUserModel.fromMap(c)).toList();
    } else {
      list = [];
    }
    return list;
  }
}
