import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogin/barcode_generate.dart';
import 'package:flutterlogin/barcode_scanner.dart';
import 'package:flutterlogin/home_page.dart';
import 'package:flutterlogin/inventory.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final items = const [
    Icon(Icons.inventory, size: 30,),
    Icon(Icons.home, size: 30,),
    Icon(Icons.qr_code_2, size: 30,),
    Icon(Icons.qr_code_scanner, size: 30,),

  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex){
          setState(() {
            index = selectedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.orangeAccent,
        animationDuration: const Duration(microseconds: 300),
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const InventoryPage();
        break;
      case 1:
        widget = const HomePage();
        break;
      case 2:
        widget = const BarcodeGenerate();
        break;
      default:
        widget = const BarcodeScanner();
        break;
    }
    return widget;
  }
}
