import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/productdetails_screen.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/productcontroller.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductController>(context);
    return Container(
      margin: EdgeInsets.only(
        left: 8,
        top: 5,
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: RaisedButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(product),
                      ),
                    );
                  },
                  child: Image.network(
                    product.img,
                    width: 78,
                    height: 78,
                  ),
                ),
                width: 130,
                height: 130,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 3),
                  child: Text(
                    '-10%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Positioned(
                right: 1,
                bottom: 1,
                child: Container(
                  child: IconButton(
                    onPressed: () async {
                      product.toggleDone();
                      await productProvider.updateDocument(
                          Product(
                            name: product.name,
                            price: product.price,
                            img: product.img,
                            isLike: product.isLike,
                            description: product.description,
                          ).toJson(),
                          product.id);
                    },
                    icon: Icon(
                      product.isLike ? Icons.favorite : Icons.favorite_border,
                      color: product.isLike ? Colors.lightBlue : Colors.grey,
                      size: 22,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 122,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '¥${product.price}.00',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w800),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
