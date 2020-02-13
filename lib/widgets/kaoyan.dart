import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dingdong/widgets/productcard.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/productcontroller.dart';

final topText = Padding(
  padding: EdgeInsets.only(top: 10, left: 15, right: 8, bottom: 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        '考研专区',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
      ),
      Text(
        '更多 >',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      )
    ],
  ),
);

class KaoYan extends StatelessWidget {
  List<Product> products;
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductController>(context);
    return Column(
      children: <Widget>[
        topText,
        SizedBox(
          height: 190,
          child: StreamBuilder<QuerySnapshot>(
            stream: productProvider.streamDataCollection(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Errot${snapshot.error}');
              }
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map(
                      (doc) => Product.fromMap(doc.data, doc.documentID),
                    )
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCard(products[index]);
                  },
                );
              } else {
                print('kaoyan');
                return CircularProgressIndicator();
              }
            },
          ),
        )
      ],
    );
  }
}

/*
* ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          ),
*
*
* */
