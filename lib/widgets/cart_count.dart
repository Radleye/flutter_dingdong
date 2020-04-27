import 'package:flutter/material.dart';
import 'package:flutter_dingdong/model/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/cartprovider.dart';

class CartCount extends StatelessWidget {
  final Cart item;
  CartCount(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          reduceBtn(context),
          countArea(),
          addBtn(context),
        ],
      ),
    );
  }

  //减少按钮
  Widget reduceBtn(context) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false)
            .addOrReduce(item, 'minus');
      },
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: item.count > 1 ? Colors.white : Colors.black12,
            border: Border(
                right: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
        child: item.count > 1 ? Text('-') : Text(' '),
      ),
    );
  }

  Widget addBtn(context) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false)
            .addOrReduce(item, 'add');
      },
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
        child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget countArea() {
    return Container(
      width: 38,
      height: 30,
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }
}
