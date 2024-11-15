import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';

class LocalDataSource {
  static final LocalDataSource _instance = LocalDataSource._internal();

  factory LocalDataSource() {
    return _instance;
  }

  LocalDataSource._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('to_Do.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // 데이터베이스 테이블 생성
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE MyLists (
        id TEXT PRIMARY KEY,
        name TEXT,
        colorValue INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE ToDoLists (
        id TEXT PRIMARY KEY,
        title TEXT,
        description TEXT,
        date TEXT,
        time TEXT,
        isCompleted INTEGER,
        myListId TEXT,
        FOREIGN KEY (myListId) REFERENCES MyLists (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> insertMyList(MyListModel myList) async {
    final db = await database;
    return await db.insert('MyLists', myList.toMap());
  }

  Future<int> insertToDoList(ToDoListsModel toDoList, String myListId) async {
    final db = await database;
    Map<String, dynamic> map = toDoList.toMap();
    map['myListId'] = myListId; // 외래키 설정
    return await db.insert('ToDoLists', map);
  }

  Future<List<MyListModel>> getMyLists() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('MyLists');
    return List.generate(
      maps.length,
      (i) {
        return MyListModel.fromMap(maps[i]);
      },
    );
  }

  Future<List<ToDoListsModel>> getToDoLists(String myListId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db
        .query('ToDoLists', where: 'myListId = ?', whereArgs: [myListId]);
    return List.generate(
      maps.length,
      (i) {
        return ToDoListsModel.fromMap(maps[i]);
      },
    );
  }
}
