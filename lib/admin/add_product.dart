import 'dart:io';

import 'package:ecommerce/widget/support_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  TextEditingController namecontroller = new TextEditingController();
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() {
    if (selectedImage != null && namecontroller.text != "") {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStoreageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);

      final UploadTask task = firebaseStoreageRef.putFile(selectedImage!);
    }
  }

  String? value;
  final List<String> categoryitem = ['Watch', 'Laptop', 'TV', 'Headphones'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_outlined)),
            title: Text(
              "Add Product",
              style: Appwidget.semiboldtextfeild(),
            )),
        body: Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Upload the product image",
                  style: Appwidget.lighttextstyle()),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Product Name", style: Appwidget.lighttextstyle()),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Product category", style: Appwidget.lighttextstyle()),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: categoryitem
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: Appwidget.semiboldtextfeild())))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            this.value = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Category"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: value,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Product",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ])));
  }
}
