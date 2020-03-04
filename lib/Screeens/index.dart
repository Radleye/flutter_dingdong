import 'package:flutter/material.dart';
import 'package:flutter_dingdong/constants/myIcon.dart';
import 'package:flutter_dingdong/Screeens/cart_screen.dart';
import 'package:flutter_dingdong/Screeens/shop_screen.dart';
import 'package:flutter_dingdong/Screeens/addtask_screen.dart';
import 'package:flutter_dingdong/Screeens/message_screen.dart';
import 'package:flutter_dingdong/Screeens/profile_screen.dart';

class Index extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex;
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      title: Text('商铺'),
      icon: Icon(MyIcon.shop),
    ),
    BottomNavigationBarItem(
      title: Text('我的订单'),
      icon: Icon(MyIcon.bag),
    ),
    BottomNavigationBarItem(
      title: Text('发布'),
      icon: Icon(MyIcon.add),
    ),
    BottomNavigationBarItem(
      title: Text('消息'),
      icon: Icon(MyIcon.message),
    ),
    BottomNavigationBarItem(
      title: Text('个人'),
      icon: Icon(MyIcon.profile),
    ),
  ];
  final List pages = [ShopScreen(), Cart(), AddScreen(), Message(), Profile()];
  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: pages[_selectedIndex],
    );
  }
}
