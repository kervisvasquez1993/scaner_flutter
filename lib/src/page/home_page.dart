import 'package:flutter/material.dart';
import 'package:qr_flutter/src/page/direcciones_page.dart';
import 'package:qr_flutter/src/page/mapa_page.dart';
import 'package:qr_flutter/src/page/mapas_page.dart';
import 'package:qr_flutter/src/widgets/custom_navigator.dart';
import 'package:qr_flutter/src/widgets/scam_bottom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNvigationBar(),
      floatingActionButton: ScamButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  Widget build(BuildContext context) {
    final currentIndex = 0;
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapaPage();
    }
  }
}
