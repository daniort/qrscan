import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/services/scan_list.dart';
import 'package:scanner/widgets/metodos.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final _scanListState = Provider.of<ScanListState>(context, listen: true);
    Size _size = MediaQuery.of(context).size;
    List scans = _scanListState.scans;
    if (_scanListState.scans.isEmpty)
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric( horizontal:20 ),
          width: _size.width,
          height: _size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Abre la cámara y escanea tu primer código QR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              ),
              SizedBox( height: 10 ),
              Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.grey,)
            ],
          ),
        ),
      );

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          onDismissed: (dir) {
            _scanListState.borrarScansPorID(scans[index].id);
          },
          direction: DismissDirection.startToEnd,
          key: Key(scans[index].id.toString()),
          background: Container(
            padding: EdgeInsets.only(left: 10),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.pink, Colors.red[800]],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Row(
              children: [
                Icon(Icons.delete, color: Colors.white),
                SizedBox(width: 5),
                Text('Eliminar', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          child: ListTile(
            leading: Icon(this.tipo == 'http' ? Icons.link : Icons.map,
                color: Theme.of(context).primaryColor),
            title: Text(scans[index].valor),
            // subtitle: Text("Id: " + scans[index].id.toString()),
            // subtitle: scans[index].fecha == null ? Text('') : Text("${scans[index].fecha.year}"),
            trailing: Icon(Icons.open_in_new, color: Colors.grey),
            onTap: () => launchURL(context, scans[index]),
          ),
        );
      },
    );
  }
}
