import 'package:flutter/material.dart';
import 'package:qr_flutter/src/page/home_page.dart';
import 'package:qr_flutter/src/page/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR LECTOR',
      initialRoute: 'home',
      routes: {'home': (_) => HomePage(), 'mapas': (_) => MapaPage()},
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple)),
    );
  }
}
