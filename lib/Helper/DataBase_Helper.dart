import 'package:path/path.dart';
import 'package:quotes_app/Model/DataBase_Model.dart';
import 'package:sqflite/sqflite.dart';

class DataBase_Helper {
  DataBase_Helper._();

  static DataBase_Helper dataBase_Helper = DataBase_Helper._();

  static Database? db;

  Future initDB() async {
    String dbLocation = await getDatabasesPath();
    String path = join(dbLocation, "budget.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, _) async {
        String query =
            "CREATE TABLE IF NOT EXISTS budget(email TEXT,password TEXT);";
        await db.execute(query);
      },
    );
  }

  Future<int> InsertLogin({required Login_Model data}) async {
    await initDB();
    String query =
        "INSERT INTO budget(amount,spendingMode,note,image,typeOFSpending) VALUES(?,?,?,?,?,?);";
    List args = [data.email, data.password];
    return db!.rawInsert(query, args);
  }

  Future<List<Login_Model>> fetchAllData() async {
    await initDB();
    String query = "SELECT * FROM budget;";
    List<Map<String, dynamic>>? responce = await db?.rawQuery(query);

    List<Login_Model> AllData =
        await responce!.map((e) => Login_Model.fromSQl(data: e)).toList();
    return AllData;
  }
}
