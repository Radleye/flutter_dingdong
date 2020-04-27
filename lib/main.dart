import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/index.dart';
import 'package:flutter_dingdong/Screeens/login_screen.dart';
import 'package:flutter_dingdong/Screeens/loginup_screen.dart';
import 'package:flutter_dingdong/Screeens/message_screen.dart';
import 'package:flutter_dingdong/Screeens/productdetails_screen.dart';
import 'package:flutter_dingdong/Screeens/shop_screen.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:flutter_dingdong/model/productcontroller.dart';
import 'package:flutter_dingdong/model/cartprovider.dart';
import 'package:flutter_dingdong/model/userprovider.dart';
import 'package:flutter_dingdong/model/dmeandprovider.dart';
import 'Screeens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController('product'),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider('user'),
        ),
        ChangeNotifierProvider(
          create: (context) => DemandProvider('demand'),
        ),
      ],
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          LoginUpScreen.id: (context) => LoginUpScreen(),
          ShopScreen.id: (context) => ShopScreen(),
          ProductDetails.id: (context) => ProductDetails(product),
          Message.id: (context) => Message(),
        },
      ),
    );
  }
}

/*
*
*
*
*
*
*
* */
