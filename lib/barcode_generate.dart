import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeGenerate extends StatefulWidget {
  const BarcodeGenerate({Key? key}) : super(key: key);

  @override
  State<BarcodeGenerate> createState() => _BarcodeGenerateState();
}

class _BarcodeGenerateState extends State<BarcodeGenerate> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) =>Scaffold(
      appBar: AppBar(
        title: Text('Generate Barcode'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                elevation: 6,
                shadowColor: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child:BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: controller.text,
                    width: 200,
                    height: 200,
                    drawText: false,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: buildTextField(context),
              ),
            ],
          ),
        ),
      ),
    );
  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    onSubmitted: (_) => setState(() {}),
    decoration: InputDecoration(
        hintText: 'Enter Data',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.white),
        )
    ),
  );
  }

