import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/cartprovider.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          selectAllBtn(context),
          allPriceArea(context),
          goButton(context),
        ],
      ),
    );
  }

  Widget selectAllBtn(context) {
    bool isAllCheck = Provider.of<CartProvider>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.lightBlue,
            onChanged: (bool value) {
              Provider.of<CartProvider>(context, listen: false)
                  .changeAllCheckBtnState(value);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  Widget allPriceArea(context) {
    int allPrice = Provider.of<CartProvider>(context).allPrice;
    return Container(
      width: 170,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 80,
              ),
              Container(
                width: 50,
                child: Text(
                  '合计：',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 40,
                child: Text(
                  '¥${allPrice}',
                  style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                ),
              ),
            ],
          ),
          Container(
            width: 170,
            alignment: Alignment.bottomRight,
            child: Text(
              '满10元免配送费,预约免送配送费',
              style: TextStyle(color: Colors.black38, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

  Widget goButton(context) {
    int allCount = Provider.of<CartProvider>(context).allGoodsCount;
    return Container(
      width: 100,
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            '结算(${allCount})',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
