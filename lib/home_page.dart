import 'package:flutter/material.dart';
import 'package:flutterlogin/utils/color_utils.dart';
import 'package:flutterlogin/widgets/nav_drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Card makeDashboardItem(String title, String img, int index){
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              hexStringColor("#004493"),
              hexStringColor("#ADD1FA"),
              hexStringColor("#D18113"),
              hexStringColor("#EAA648"),
              hexStringColor("#FFDDAF"),
            ],
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                blurRadius: 3,
                offset: Offset(2, 2)
            )
          ],
        ),
        child: InkWell(
          onTap: (){
            if(index==0){
              //1.item
            }
            if(index==1){
              //2.item
            }
            if(index==1){
              //3.item
            }
            if(index==1){
              //4.item
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(
                  height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Center(child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Rice Stock Inventory",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem("Princess Bea","images/rice.png",0),
                makeDashboardItem("Valencia Rice","images/rice.png",1),
                makeDashboardItem("Young Chow","images/rice.png",2),
                makeDashboardItem("Sinandomeng","images/rice.png",3)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
