import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: const [
          Text('Inventory', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 100,),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.search, size: 120,),
          ),
          SizedBox(height: 100,),
          Text('Inventory Page', style: TextStyle(fontSize: 30, color: Colors.white)),
        ],
      ),
    );
  }
}
