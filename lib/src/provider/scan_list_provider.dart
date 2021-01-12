import 'package:flutter/material.dart';
import 'package:qr_flutter/src/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSelecionado = "http";
  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // asiganr el id a la base de datos
    nuevoScan.id = id;
    if (this.tipoSelecionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScan() async {
    final scans = await DBProvider.db.getScanByAll();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScanByTipo(tipo);
    this.scans = [...scans];
    this.tipoSelecionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAll();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    this.cargarScanPorTipo(this.tipoSelecionado);
  }
}
