import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';

class LocalDataSource {
  static final LocalDataSource instance = LocalDataSource._init();
  static Database? _database;

  LocalDataSource._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('toDo.db');
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

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE my_lists (
      name $textType PRIMARY KEY,
      colorValue $intType
    )
    ''');

    await db.execute('''
    CREATE TABLE todos (
      id $idType,
      title $textType,
      description $textType,
      date $textType,
      time $textType,
      isCompleted $boolType,
      listName $textType,
      FOREIGN KEY (listName) REFERENCES my_lists(name) ON DELETE CASCADE
    )
    ''');
  }

  // MyListsModel functions
  Future<void> insertMyList(MyListsModel list) async {
    final db = await instance.database;
    await db.insert(
      'my_lists',
      {
        'name': list.name,
        'colorValue': list.colorValue,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (var todo in list.toDoLists) {
      await insertToDoList(todo, list.name);
    }
  }

  Future<List<MyListsModel>> getAllMyLists() async {
    final db = await instance.database;
    final result = await db.query('my_lists');

    List<MyListsModel> myLists = [];
    for (var row in result) {
      final todos = await getToDoListsForMyList(row['name'] as String);
      myLists.add(MyListsModel(
        name: row['name'] as String,
        colorValue: row['colorValue'] as int,
        toDoLists: todos,
      ));
    }
    return myLists;
  }

  Future<void> deleteMyList(String name) async {
    final db = await instance.database;
    await db.delete(
      'my_lists',
      where: 'name = ?',
      whereArgs: [name],
    );
  }

  Future<void> updateMyList(MyListsModel list) async {
    final db = await instance.database;
    await db.update(
      'my_lists',
      {
        'name': list.name,
        'colorValue': list.colorValue,
      },
      where: 'name = ?',
      whereArgs: [list.name],
    );

    // Update or insert associated ToDoLists
    for (var todo in list.toDoLists) {
      await insertToDoList(todo, list.name);
    }
  }

  // ToDoListsModel functions with foreign key
  Future<void> insertToDoList(ToDoListsModel todo, String listName) async {
    final db = await instance.database;
    await db.insert(
      'todos',
      {
        ...todo.toMap(),
        'listName': listName,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ToDoListsModel>> getToDoListsForMyList(String listName) async {
    final db = await instance.database;
    final result = await db.query(
      'todos',
      where: 'listName = ?',
      whereArgs: [listName],
    );

    return result.map((json) => ToDoListsModel.fromMap(json)).toList();
  }
}
