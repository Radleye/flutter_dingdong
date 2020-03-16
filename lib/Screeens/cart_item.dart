import 'package:flutter/material.dart';
import 'package:flutter_dingdong/model/cart.dart';

class CartItem extends StatelessWidget {
  final Cart item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Row(
        children: <Widget>[
          _cartImage(),
        ],
      ),
    );
  }

  Widget _cartCheckBt() {
    return Container(
      child: Checkbox(
        value: true,
        onChanged: (bool val) {},
        activeColor: Colors.lightBlue,
      ),
    );
  }

  Widget _cartImage() {
    return Container(
      width: 150,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Image.network(item.img),
    );
  }

  Widget _cartGoodname() {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.name),
        ],
      ),
    );
  }

  Widget _cartPrice() {
    return Container(
      width: 150,
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('¥${item.price}'),
          Container(
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.delete_forever,
                size: 20,
                color: Colors.black26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
