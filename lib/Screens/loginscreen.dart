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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: form,
          child: Column(children: [
            Container(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpg'),
                radius: 50,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                controller: email,
                validator: (String? value) {
                  if (value == null || value == "") {
                    return "Email field is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Enter your email", prefixIcon: Icon(Icons.mail)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                obscureText: hidePassword,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: !hidePassword
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            child: Icon(Icons.visibility))
                        : InkWell(
                            onTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            child: Icon(Icons.visibility_off))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (form.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful")));
                  } else {
                    print("Login Failed");
                  }
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/register");
                },
                child: Text("Register Now"))
          ]),
        ),
      ),
    );
  }
}
