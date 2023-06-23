import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterlogin/utils/color_utils.dart';
import 'package:flutterlogin/widgets/reusable_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future signup()async{
    var url = "http://192.168.1.4/mydb/conn.php";
    var response = await http.post(Uri.parse(url), body:{
      "username" : username.text,
      "password" : password.text,
    });
    var data = json.decode(response.body);
    if (data == "Error"){
      Fluttertoast.showToast(
          msg: "This user already exists",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "Registered Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringColor("#004493"),
              hexStringColor("#ADD1FA"),
              hexStringColor("#D18113"),
              hexStringColor("#EAA648"),
              hexStringColor("#FFDDAF"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,
                MediaQuery.of(context).size.height *0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/signup.png"),
                const SizedBox(
                  height: 20,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: username,
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: 'Username',
                      prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.black
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0.1,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.black
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    signup();
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
