//  await Databasemethods().AddProduct(addProduct, value!).then((value) {
//         selectedImage = null;
//         namecontroller.text = "";
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.redAccent,
//             content: Text(
//               "Product has been uploaded",
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ),
//         );
//       });

//       Future getImage() async {
//     var image = await _picker.pickImage(source: ImageSource.gallery);
//     selectedImage = File(image!.path);
//     setState(() {});
//   }