import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String? scanResult;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(style: ElevatedButton.styleFrom(
              primary: Colors.amber, onPrimary: Colors.black,
            ),
              icon: Icon(Icons.camera_alt_outlined),
              label: Text('Start Scan'),
              onPressed: scanBarcode,
            ),
            SizedBox(height: 20),
            Text(
              scanResult == null
              ?'Scan a code!'
              : 'Scan result :$scanResult',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );

    Future scanBarcode() async {
      String scanResult;
      try {
        scanResult = await FlutterBarcodeScanner.scanBarcode(
            "ff6666",
            "Cancel",
            true,
            ScanMode.BARCODE
        );
      } on PlatformException {
        scanResult = 'Failed to get platform version.';
      }
      if (!mounted) return;

      setState(() => this.scanResult = scanResult);
    }
}
