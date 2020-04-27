import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:flutter_dingdong/model/productcontroller.dart';
import 'package:flutter_dingdong/widgets/hotdetails.dart';
import 'package:flutter_dingdong/widgets/productcard11.dart';
import 'package:flutter_dingdong/widgets/tbottombar.dart';
import 'package:flutter_dingdong/widgets/topcategories.dart';
import 'package:flutter_dingdong/widgets/kaoyan.dart';
import 'package:flutter_dingdong/constants/myIcon.dart';

final _firebase = Firestore.instance;
List<Product> products;

class ShopScreen extends StatelessWidget {
  static const String id = 'shop_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.reorder), onPressed: () {}),
        title: Text(
          '咚咚',
          style: TextStyle(
            fontFamily: 'ZCOOLXiaoWei',
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), iconSize: 28, onPressed: () {}),
          IconButton(icon: Icon(Icons.add_alert), onPressed: () {}),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TopCategories(),
            HotDetails(),
            KaoYan(),
          ],
        ),
      ),
    );
  }
}

Future<List<Product>> getdata() async {
  ProductController productController = ProductController('product');
  return await productController.fetchProducts();
}

messageStream() async {
  await for (var snapshot in _firebase.collection('User').snapshots()) {
    for (var book in snapshot.documents) {
      print(book.data);
    }
  }
}

class MyStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebase.collection('User').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Erro ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print('Documents ${snapshot.data.documents.length}');
          return buildList(context, snapshot.data.documents);
        }
        return CircularProgressIndicator(
          backgroundColor: Colors.blue,
        );
      },
    );
  }
}

Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    children: snapshot.map((data) => bulidListItem(context, data)).toList(),
  );
}

Widget bulidListItem(BuildContext context, DocumentSnapshot data) {
  final name = data.data['name'];
  return Text(name);
}
/*
class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebase.collection('product').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          products = snapshot.data.documents
              .map((doc) => Product.fromMap(doc.data, doc.documentID))
              .toList();
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(products[index]);
            },
          );
        } else {
          return Text('fech');
        }
      },
    );
  }
}
*/
