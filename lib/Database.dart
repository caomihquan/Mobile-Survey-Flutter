import 'dart:async';
import 'package:pokedex/model/JsonQuestionModel.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBProvider {
  // DBProvider._();
  // static final DBProvider db = DBProvider._();
  // static Database _database;
  // Future<Database> get database async {
  //   if (_database != null) return _database;

  //   // if _database is null we instantiate it
  //   _database = await initDB();
  //   return _database;
  // }

  // initDB() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, "TestDB.db");
  //   return await openDatabase(path, version: 1, onOpen: (db) {},
  //       onCreate: (Database db, int version) async {
  //     await db.execute("CREATE TABLE Client ("
  //         "id INTEGER,"
  //         "first_name TEXT,"
  //         "last_name TEXT,"
  //         "blocked BIT"
  //         ")");
  //   });
  // }

  static Future<void> createTable(sql.Database database) async {
    await database.execute("CREATE TABLE Question("
        "QuestionID TEXT,"
        "QuestionName TEXT,"
        "AnswerResult TEXT,"
        "QuestionType INTEGQER"
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
    List<JsonQuestionModel> list =
        data.isNotEmpty ? data.map((c) => JsonQuestionModel.fromMap(c)).toList() : [];
    return list;
  }

  static Future<List<JsonQuestionModel>> getQuestion(String? id) async {
    final db = await DBProvider.db();
    var data = await db.query('Question', where: "QuestionID = ?", whereArgs: [id], limit: 1);
    List<JsonQuestionModel> list =
        data.isNotEmpty ? data.map((c) => JsonQuestionModel.fromMap(c)).toList() : [];
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
    try {
      await db.delete("Question", where: "QuestionID = ?", whereArgs: [id]);
    } catch (err) {}
  }

  // newClient(Client newClient) async {
  //   final db = await database;
  //   //get the biggest id in the table
  //   var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
  //   int id = table.first["id"];
  //   //insert to the table using the new id
  //   var raw = await db.rawInsert(
  //       "INSERT Into Client (id,first_name,last_name,blocked)"
  //       " VALUES (?,?,?,?)",
  //       [id, newClient.firstName, newClient.lastName, newClient.blocked]);
  //   return raw;
  // }

  // blockOrUnblock(Client client) async {
  //   final db = await database;
  //   Client blocked = Client(
  //       id: client.id,
  //       firstName: client.firstName,
  //       lastName: client.lastName,
  //       blocked: !client.blocked);
  //   var res = await db.update("Client", blocked.toMap(),
  //       where: "id = ?", whereArgs: [client.id]);
  //   return res;
  // }

  // updateClient(Client newClient) async {
  //   final db = await database;
  //   var res = await db.update("Client", newClient.toMap(),
  //       where: "id = ?", whereArgs: [newClient.id]);
  //   return res;
  // }

  // getClient(int id) async {
  //   final db = await database;
  //   var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
  //   return res.isNotEmpty ? Client.fromMap(res.first) : null;
  // }

  // Future<List<Client>> getBlockedClients() async {
  //   final db = await database;
  //   print("works");
  //   var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

  //   List<Client> list =
  //       res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
  //   return list;
  // }

  // Future<List<Client>> getAllClients() async {
  //   final db = await database;
  //   var res = await db.query("Client");
  //   List<Client> list =
  //       res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
  //   return list;
  // }

  // deleteClient(int id) async {
  //   final db = await database;
  //   return db.delete("Client", where: "id = ?", whereArgs: [id]);
  // }

  // deleteAll() async {
  //   final db = await database;
  //   db.rawDelete("Delete * from Client");
  // }
}
