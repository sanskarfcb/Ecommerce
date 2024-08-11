import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/admin/home_admin.dart';
import 'package:ecommerce/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => AdminloginState();
}

class AdminloginState extends State<Adminlogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 80, left: 20.0, right: 20.0, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/login2.jpg"),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "Admin Panel",
                  style: Appwidget.semiboldtextfeild(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Username",
                style: Appwidget.semiboldtextfeild(),
              ),
              SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F5F9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Username"),
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
                    controller: userpasswordcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Password"),
                  )),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  loginAdmin();
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
            ],
          ),
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "You're ID is not correct",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } else if (result.data()['password'] !=
            userpasswordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Password wrong",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => homeadmin()));
        }
      });
    });
  }
}
