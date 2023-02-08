import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireloginfebeight/reusable_widgets/reusable_widgets.dart';
import 'package:fireloginfebeight/screens/homescreen.dart';
import 'package:flutter/material.dart';

import '../colors_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "Full Name", Icons.person, false, _nameTextController),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "password", Icons.lock, false, _passwordTextController),
                const SizedBox(
                  height: 30,
                ),
                signinsignupButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
