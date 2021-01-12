import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/src/page/home_page.dart';
import 'package:qr_flutter/src/page/mapa_page.dart';
import 'package:qr_flutter/src/provider/scan_list_provider.dart';
import 'package:qr_flutter/src/provider/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // el multiprovide
      providers: [
        ChangeNotifierProvider(create: (_) => new UIProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR LECTOR',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'mapas': (_) => MapaPage()},
        theme: ThemeData(
            primaryColor: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange)),
      ),
    );
  }
}
