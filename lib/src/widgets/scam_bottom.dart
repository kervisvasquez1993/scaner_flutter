import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScamButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        /* String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#3d8bef", "Cancelar", false, ScanMode.QR); */
        final barcodeScanRes = "https://kervisvasquez.online";
        print(barcodeScanRes);
      },
    );
  }
}
