import 'package:ecommerce/widget/support_widget.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.arrow_back_ios_new_outlined)),
              ),
              Center(
                  child: Image.asset(
                "images/headphone2.png",
                height: 400,
              ))
            ]),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Headphone",
                          style: Appwidget.boldtextstyle(),
                        ),
                        Text("\$300",
                            style: TextStyle(
                                color: Color(0xFFfd6f3e),
                                fontSize: 23.0,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Details",
                      style: Appwidget.semiboldtextfeild(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Equipped with custom-tuned 40mm drivers, the XG-200 delivers rich, immersive audio with deep bass, clear mids, and crisp highs.\nAdvanced ANC technology blocks out unwanted ambient noise, allowing you to focus on your music or calls without distractions"),
                    SizedBox(
                      height: 90.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFfd6f3e),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
