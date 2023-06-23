import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterlogin/dashboard.dart';
import 'package:flutterlogin/signup_page.dart';
import 'package:flutterlogin/utils/color_utils.dart';
import 'package:flutterlogin/widgets/reusable_widget.dart';
import 'package:http/http.dart'as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static const String baseUrl = 'http://192.168.1.2:8080/api/';

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(baseUrl + 'login/');
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }

  }

  void navigateAfterAuth(BuildContext context, String token) {
    // Replace these routes with your actual app routes
    if (token.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    } else {
      print("login error");
    }
  }

  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                logoWidget("images/final.png"),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(
                          Icons.alternate_email_outlined,
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
                SizedBox(
                  height: 0.1,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
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
                SizedBox(
                  height: 10,
                ),
                forgotPassword(),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: ()  {
                    login(email: emailController.text, password: passwordController.text);
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
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            child: const Text (
              "Forgot Password?",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            )
        )
      ],
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            child: const Text (
              "Sign Up",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            )
        )
      ],
    );
  }
}




