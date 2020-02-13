import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:flutter_dingdong/model/productcontroller.dart';
import 'package:flutter_dingdong/widgets/productcard.dart';
import 'package:provider/provider.dart';

class MyInformation extends StatelessWidget {
  List<Product> products;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductController>(context);
    return Container();
  }
}
