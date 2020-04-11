import 'package:flutter/material.dart';

class CartCount extends StatelessWidget {
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
          reduceBtn(),
          countArea(),
          addBtn(),
        ],
      ),
    );
  }

  //减少按钮
  Widget reduceBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                right: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
        child: Text('-'),
      ),
    );
  }

  Widget addBtn() {
    return InkWell(
      onTap: () {},
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
      child: Text('1'),
    );
  }
}
