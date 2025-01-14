import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'usuarios.db');
    return openDatabase(path, onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE usuarios(id INTEGER PRIMARY KEY, nombre TEXT, email TEXT, fecha_registro TEXT)',
      );
    }, version: 1);
  }

  // Insertar un nuevo usuario
  Future<void> insertarUsuario(Map<String, dynamic> usuario) async {
    final db = await database;
    await db.insert('usuarios', usuario, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Obtener todos los usuarios
  Future<List<Map<String, dynamic>>> obtenerUsuarios() async {
    final db = await database;
    return await db.query('usuarios');
  }
}