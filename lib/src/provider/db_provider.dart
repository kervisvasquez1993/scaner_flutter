import 'dart:io';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr_flutter/src/models/scan_model.dart';
export 'package:qr_flutter/src/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();
  // ESTO SIRVE , PARA QUE CUANDO HAGA UNA INSTANCIA DE MI BASE DE DATOS, SIEMPRE SEA LA MISMA

/* estructura de un singerton */
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // path donde almacenaremos la base de datos
    Directory documentsDirectory =
        await getExternalStorageDirectory(); // getExternalStorageDirectory // getApplicationDocumentsDirectory
    final path = join(documentsDirectory.path, "ScansDB.db");
    print("===============Ruta de la BD ==================");
    print(path);
    print(documentsDirectory);
    //crear BD
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
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

  nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    //verificar la bd
    final db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Scans(id,tipo,valor)
      VALUES($id,$tipo, $valor)
    ''');

    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    // verificar la bd
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    /* print("======obtener insercion ======");
    print(res); */

    // res es el ID del ultimo producto insertado.
    return res;
  }

  //traer informacion
  Future<ScanModel> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getScanByAll() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScanByTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
     SELECT * FROM Scans WHERE tipo = $tipo

    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

// actualizar
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update("Scans", nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  // borrar

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete("Scans", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.delete("Scans", where: "id = ?");
    return res;
  }
}
