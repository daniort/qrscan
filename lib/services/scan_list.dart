import 'package:flutter/cupertino.dart';
import 'package:scanner/services/db.dart';

class ScanListState with ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final int id = await DBState.db.nuevoScan(nuevoScan);
    // asignamos el id de l bd al modelo
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  Future<void> cargarScans() async {
    final scans = await DBState.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  Future<void> cargarScanPorTipo(String tipo) async {
    final scans = await DBState.db.getScansByTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  Future<void> borrarTodosScans() async {
    await DBState.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  Future<void> borrarScansPorID(int id) async {
    await DBState.db.deleteScan(id);
    this.cargarScanPorTipo(this.tipoSeleccionado);
  }
}
