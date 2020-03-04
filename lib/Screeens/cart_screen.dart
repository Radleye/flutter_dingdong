import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/cartprovider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text('购物车'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getCatinfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List cartList = Provider.of<CartProvider>(context).cartList;
            return ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartList[index].name),
                  );
                });
          } else {
            return Text('loding');
          }
        },
      ),
    );
  }

  Future<String> _getCatinfo(BuildContext context) async {
    await Provider.of<CartProvider>(context).getCartInfo();
    return 'end';
  }
}
