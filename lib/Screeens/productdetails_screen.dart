import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/shop_screen.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/cartprovider.dart';

int quantity = 1;

class ProductDetails extends StatefulWidget {
  static const String id = 'productdetails_screen';
  final Product product;
  ProductDetails(this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final cartInfoProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('商品详情'),
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 130,
                left: 30,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  elevation: 5,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 65,
                          ),
                          Text(
                            widget.product.name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '¥${widget.product.price}.00',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          RatingBar(
                            itemSize: 25,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Text(
                            '数量',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.black,
                                      style: BorderStyle.solid),
                                  onPressed: () {
                                    setState(() {
                                      quantity--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.black,
                                      style: BorderStyle.solid),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 200,
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                OutlineButton(
                                  onPressed: () async {
                                    await cartInfoProvider.save(
                                      widget.product.id,
                                      widget.product.name,
                                      widget.product.price,
                                      widget.product.img,
                                      quantity,
                                      widget.product.isLike,
                                    );
                                  },
                                  child: Text(
                                    '立即购买',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  highlightColor: Colors.lightBlue,
                                  borderSide: BorderSide(color: Colors.blue),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 200,
                            child: FlatButton(
                              color: Colors.lightBlue,
                              onPressed: () async {
                                await cartInfoProvider.remove();
                              },
                              child: Text(
                                '加入购物车',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 80,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        child: RaisedButton(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          elevation: 5,
                                          onPressed: () {},
                                          child: Image.network(
                                            widget.product.img,
                                            width: 120,
                                            height: 120,
                                          ),
                                        ),
                                        width: 200,
                                        height: 160,
                                      ),
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 3,
                                              left: 5,
                                              right: 5,
                                              bottom: 3),
                                          child: Text(
                                            '-10%',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          child: IconButton(
                                            icon: Icon(
                                              widget.product.isLike
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: widget.product.isLike
                                                  ? Colors.lightBlue
                                                  : Colors.grey,
                                              size: 22,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

/*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
* */
