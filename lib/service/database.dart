import 'package:controle_do_mercadinho/model/item.dart';
import 'package:controle_do_mercadinho/service/databaseInterface.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ItemDatabase implements IDatabase {
  static final _databaseName = "items.db";
  static final _databaseVersion = 1;

  static final table = 'items';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnPrice = 'price';
  static final columnAmount = 'amount';

  // make this a singleton class
  ItemDatabase._privateConstructor();
  static final ItemDatabase instance = ItemDatabase._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnPrice REAL NOT NULL,
            $columnAmount INTEGER NOT NULL
          )
          ''');
  }

  Future<void> insertItem(Item item) async {
    // Get a reference to the database.
    final Database db = await database;

    await db.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> getItems() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('items');

    return List.generate(maps.length, (i) {
      return Item(
          id: maps[i]['id'],
          name: maps[i]['name'],
          price: maps[i]['price'],
          amount: maps[i]['amount']);
    });
  }

  Future<double> getValue() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('items');

    var list = List.generate(maps.length, (i) {
      return Item(
          id: maps[i]['id'],
          name: maps[i]['name'],
          price: maps[i]['price'],
          amount: maps[i]['amount']);
    });

    double values = 0.0;

    list.forEach((element) {
      values = values + element.price;
    });

     print(values);

    return values;
  }

  Future<void> delete(String id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
