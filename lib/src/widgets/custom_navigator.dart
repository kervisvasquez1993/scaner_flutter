import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/src/provider/ui_provider.dart';

class CustomNvigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider =
        Provider.of<UIProvider>(context); // elemento seleccionado
    final currentIndex = uiProvider;
    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex.selectedMenuOpt,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('mapa')),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions), title: Text('Direcciones')),
      ],
    );
  }
}
