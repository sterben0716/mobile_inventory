import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: const [
          Text('About Page', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 100,),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.home, size: 120,),
          ),
          SizedBox(height: 100,),
          Text('About Page Content', style: TextStyle(fontSize: 30, color: Colors.white)),

        ],
      ),
    );
  }
}

