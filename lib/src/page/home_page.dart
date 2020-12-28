import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/src/page/direcciones_page.dart';
import 'package:qr_flutter/src/page/mapa_page.dart';
import 'package:qr_flutter/src/page/mapas_page.dart';
import 'package:qr_flutter/src/provider/db_provider.dart';
import 'package:qr_flutter/src/provider/ui_provider.dart';
import 'package:qr_flutter/src/widgets/custom_navigator.dart';
import 'package:qr_flutter/src/widgets/scam_bottom.dart';
/* /data/user/0/com.example.qr_flutter/app_flutter/ScansDB.db */

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
    //OBTENER EL MENU OPT
    String tempScan = new ScanModel(valor: "kervis");

    DBProvider.db.nuevoScan(tempScan);

    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    // todo: Temporal leer la BD

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
