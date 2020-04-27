import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dingdong/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  String cartString = "[]";
  List<Cart> cartList = [];
  int allPrice = 0;
  int allGoodsCount = 0;
  bool isAllCheck = true;
  /*
  * 1.创建sharedPreference对象
  * 2.获得键值所对应的字符串，有的话就获得json字符串的对象，没有就是null
  * 3.json对象转化为Map数组放入到Map数组(代表购物车数组)中
  * 4.对Map数组进行遍历,如果当前传入的产品id和购物车数组当前的产品id一致,则只需把当前的产品的count对应的值加一即可，并且更新数组下标所对应的产品的数量
  * 5.购物车数组循环和传进来的productid进行对比，比较一次就比较下一个下标val++.id相同count加1
  * 6.整个循环完了都没找到，则把这个产品加入购物车数组
  * 7.把购物车数组传化为json字符串然后存储到key值所对应的数组中调用setString，实现数据持久化
  * */
  save(productId, name, price, img, count, isLike) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    var temp = cartString == null
        ? []
        : jsonDecode(cartString.toString()); //将json字符串转换成json对象
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int val = 0;
    tempList.forEach((item) {
      if (item['id'] == productId) {
        tempList[val]['count'] += item['count'];
        cartList[val].count++;
        isHave = true;
      }
      val++;
      print(val);
    });
    if (!isHave) {
      Map<String, dynamic> newProduct = {
        'id': productId,
        'name': name,
        'price': price,
        'img': img,
        'count': count,
        'isLike': isLike,
        'isCheck': true,
      };
      tempList.add(newProduct);
      cartList.add(Cart.fromJson(newProduct));
    }
    cartString = jsonEncode(tempList)
        .toString(); //将json对象转化为json字符串，因为sharedpreference的getset都是以键值对的形式，所有得到的值要通过String
    //来保存所以要转换weiString类型然后再设置，1.
    print(cartString);
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    print('删除成功-----------------');
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    cartList = [];
    if (cartString == null) {
      cartList = [];
    } else {
      allGoodsCount = 0;
      allPrice = 0;
      isAllCheck = true;
      List<Map> tempList = (jsonDecode(cartString.toString()) as List).cast();
      tempList.forEach((item) {
        if (item['isCheck']) {
          allPrice += (item['count'] * item['price']);
          allGoodsCount += item['count'];
        } else {
          isAllCheck = false;
        }
        cartList.add(Cart.fromJson(item));
      });
    }
    notifyListeners();
  }

  //删除单个购物车商品
  deleteGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempindex = 0;
    int deleteindex = 0;
    tempList.forEach((item) {
      if (item['id'] == goodsId) {
        deleteindex = tempindex;
      }
      tempindex++;
    });
    tempList.removeAt(deleteindex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  changeCheckState(Cart cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['id'] == cartItem.id) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  changeAllCheckBtnState(bool isCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    for (var item in tempList) {
      var newItem = item;
      newItem['isCheck'] = isCheck;
      newList.add(newItem);
    }

    cartString = json.encode(newList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  //商品数量加减
  addOrReduce(var cartItem, String todo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int temoIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['id'] == cartItem.id) {
        changeIndex = temoIndex;
      }
      temoIndex++;
    });
    if (todo == 'add') {
      cartItem.count++;
    } else if (todo == 'minus') {
      cartItem.count--;
    }

    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }
}
