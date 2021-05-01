import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:scanner/models/scan.dart';
export 'package:scanner/models/scan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBState {
  static Database _database;
  static final DBState db = DBState._();

  DBState._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    // Obtener del directorio
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScanDB.db');
    print('PARTH::::::::::::');
    print(path);
    // Crear  base de datos
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
        ''');
      },
    );
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = db.insert('Scans', nuevoScan.toJson());
    // retornamos el id del ultimo registro agregado
    return res;
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = db.delete('Scans');
    return res;
  }

  Future<ScanModel> getScanById(int idScan) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ? ', whereArgs: [idScan]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : [];
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>> getScansByTipo(String tipo) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo = ? ', whereArgs: [tipo]);
    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  // nuevoScanRaw(ScanModel nuevoScan) async {
  //   final id = nuevoScan.id;
  //   final tipo = nuevoScan.tipo;
  //   final valor = nuevoScan.valor;

  //   final db = await database;
  //   final res = await db.rawInsert(
  //       '''INSERT INTO Scans(id, tipo, valor) VALUES($id, '$tipo', '$valor')''');
  //   return res;
  // }
}
