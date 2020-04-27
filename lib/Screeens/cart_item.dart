import 'package:flutter/material.dart';
import 'package:flutter_dingdong/model/cart.dart';
import 'package:flutter_dingdong/model/cartprovider.dart';
import 'package:flutter_dingdong/widgets/cart_count.dart';
import 'package:provider/provider.dart';

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
          _cartCheckBt(context, item),
          _cartImage(),
          _cartGoodname(),
          _cartPrice(context),
        ],
      ),
    );
  }

  Widget _cartCheckBt(context, item) {
    return Container(
      child: Checkbox(
        value: item.isCheck,
        onChanged: (bool val) {
          item.isCheck = val;
          Provider.of<CartProvider>(context, listen: false)
              .changeCheckState(item);
        },
        activeColor: Colors.lightBlue,
      ),
    );
  }

  Widget _cartImage() {
    return Stack(
      children: <Widget>[
        Container(
          child: RaisedButton(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            onPressed: () {},
            child: Image.network(
              item.img,
              width: 78,
              height: 78,
            ),
          ),
          width: 88,
          height: 88,
        ),
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            padding: EdgeInsets.only(top: 3, left: 2, right: 5, bottom: 3),
            child: Text(
              '-10%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 7,
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
          width: 30,
          height: 30,
          right: 0,
          bottom: 0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              item.isLike ? Icons.favorite : Icons.favorite_border,
              color: item.isLike ? Colors.lightBlue : Colors.grey,
              size: 15,
            ),
          ),
        )
      ],
    );
  }

  Widget _cartGoodname() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: 100,
      child: Column(
        children: <Widget>[
          Text(item.name),
          CartCount(item),
        ],
      ),
    );
  }

  Widget _cartPrice(context) {
    return Container(
      width: 30,
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Text('¥${item.price}'),
          Container(
            child: InkWell(
              onTap: () {
                Provider.of<CartProvider>(context, listen: false)
                    .deleteGoods(item.id);
              },
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
