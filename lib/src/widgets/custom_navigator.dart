import 'package:flutter/material.dart';

class CustomNvigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('mapa')),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions), title: Text('Direcciones')),
      ],
    );
  }
}
