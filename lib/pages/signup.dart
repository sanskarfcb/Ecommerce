import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/services/database.dart';
import 'package:ecommerce/services/shared_pref.dart';
import 'package:ecommerce/widget/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email, name, password;

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (name != null && email != null && password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        String Id = randomAlphaNumeric(10);
        await SharedPreferencehelper().saveUserEmail(emailcontroller.text);
        await SharedPreferencehelper().saveUserId(Id);
        await SharedPreferencehelper().saveUserName(namecontroller.text);
        await SharedPreferencehelper().saveUserImage(
            "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a");
        Map<String, dynamic> userInfomap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "Id": Id,
          "Image":
              "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a"
        };
        await Databasemethods().adduserdetails(userInfomap, Id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bottomnav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Password provided is to weak",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Account already exists ",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        }
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
                    "Sign Up",
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
                  "Name",
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
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
                    )),
                SizedBox(
                  height: 20.0,
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
                          return 'Please enter your Email';
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
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
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        name = namecontroller.text;
                        email = emailcontroller.text;
                        password = passwordcontroller.text;
                      });
                    }
                    registration();
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
                              "SIGN UP",
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
                      "Already have a account?",
                      style: Appwidget.lighttextstyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Sign In",
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
