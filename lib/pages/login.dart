import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:ecommerce/widget/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Bottomnav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "User not found with this email",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong Password",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 80, left: 20.0, right: 20.0, bottom: 40),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/login2.jpg"),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "Sign In",
                    style: Appwidget.semiboldtextfeild(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Please enter the details below to\n                   continue",
                  style: Appwidget.lighttextstyle(),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Email",
                  style: Appwidget.semiboldtextfeild(),
                ),
                SizedBox(height: 20.0),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Color(0xFFF4F5F9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Password",
                  style: Appwidget.semiboldtextfeild(),
                ),
                SizedBox(height: 20.0),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Color(0xFFF4F5F9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget password?",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = emailcontroller.text;
                        password = passwordcontroller.text;
                      });
                    }
                    userlogin();
                  },
                  child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have a account?",
                      style: Appwidget.lighttextstyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
