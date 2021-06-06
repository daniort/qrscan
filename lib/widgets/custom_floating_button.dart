import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scanner/colors.dart';
import 'package:scanner/models/scan.dart';
import 'package:scanner/services/scan_list.dart';
import 'package:scanner/widgets/metodos.dart';

class CustomFloatButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(MiColor.primary.hex),
      
      child: Icon(Icons.filter_center_focus),
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3b8bef',
          'Cancelar',
          false,
          ScanMode.QR,
        );
        final _scanListState = Provider.of<ScanListState>(context, listen: false);
        final ScanModel nuevoScan = await _scanListState.nuevoScan(barcodeScanRes);
        // final nuevoScan = await _scanListState.nuevoScan('geo:19.256133,-99.107948');
        launchURL(context, nuevoScan);
       
      },
    );
  }
}
