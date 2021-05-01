import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/pages/direciones.dart';
import 'package:scanner/pages/mapas.dart';
import 'package:scanner/services/appstate.dart';
import 'package:scanner/services/scan_list.dart';
import 'package:scanner/widgets/custom_floating_button.dart';
import 'package:scanner/widgets/custom_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final _appState = Provider.of<AppState>(context, listen: true);
    final _scanListState = Provider.of<ScanListState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [IconButton(onPressed: () {
          _scanListState.borrarTodosScans();

        }, icon: Icon(Icons.delete))],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: CustomFloatButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appState = Provider.of<AppState>(context);
    final _scanListState = Provider.of<ScanListState>(context, listen: false);   
    
    switch (_appState.currentIndex) {
      case 0:
      _scanListState.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
      _scanListState.cargarScanPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
