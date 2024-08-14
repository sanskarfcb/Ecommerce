import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ecommerce/admin/add_product.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Databasemethods {
  Future adduserdetails(Map<String, dynamic> userInfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfomap);
  }

  Future AddProduct(
      Map<String, dynamic> userInfomap, String categoryname) async {
    return await FirebaseFirestore.instance
        .collection(categoryname)
        .add(userInfomap);
  }
}
