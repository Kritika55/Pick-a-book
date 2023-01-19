import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool hidePassword = true;
  final form = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 60, top: 220),
              child: Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Times New Roman",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "Email is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (String? value) {
                          if (value == null || value == "") {
                            return "Password field is required";
                          }
                          return null;
                        },
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w700),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
