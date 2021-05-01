import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/pages/home.dart';
import 'package:scanner/pages/mapa.dart';
import 'package:scanner/services/appstate.dart';
import 'package:scanner/services/scan_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanListState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          primaryColor: Colors.pink,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.pink),
        ),
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
      ),
    );
  }
}
