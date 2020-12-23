import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

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

  /**/

  Future<Database> initDB() async {
    // path donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
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

  nuevoScanRae(ScanModel nuevoScan) async {}
}