import 'dart:async';
import 'package:path/path.dart';
import '../models/mapel_model.dart';
import 'package:sqflite/sqflite.dart';

class Db_Helper {
  static final Db_Helper _instance = Db_Helper._instance;
  static Database? _database;

  final String tablename = 'Mapels';
  final String colid = 'id';
  final String colname = 'name';
  final String colteachname = 'teachname';
  final String colhari = 'hari';
  final String coljam = 'jam';

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  Future<Database?> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "mapels.db");
    return openDatabase(path, version: 1, onCreate: _create);
  }

  FutureOr<void> _create(Database db, int version) async {
    var sql = '''
      CREATE TABLE $tablename(
        $colid INTEGER PRIMARY KEY,
        $colname TEXT,
        $colteachname TEXT,
        $colhari TEXT,
        $coljam TEXT
      )
    ''';
    await db.execute(sql);
  }

  Future<int?> save(Mapelmodel mapelmodel) async {
    var client = await _db;
    return client!.insert(tablename, mapelmodel.toJson());
  }

  Future<List?> getAllmapels() async {
    var client = await _db;
    var result = await client!.query(tablename,
        columns: [colid, colname, colteachname, colhari, coljam]);
    return result.toList();
  }
}
