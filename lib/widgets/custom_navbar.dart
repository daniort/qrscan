import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/services/appstate.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appState = Provider.of<AppState>(context, listen: true);
    print( _appState.currentIndex );
    return BottomNavigationBar(
      currentIndex: _appState.currentIndex,
      elevation: 3.0,
      onTap: (int i) {
        print('acabas de presionar;');
        print(i);
        _appState.changeCurrentIndex = i;
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
      ],
    );
  }
}
