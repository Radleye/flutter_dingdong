import 'package:flutter/material.dart';

class MyIcon {
  static const IconData add = IconData(0xe652, fontFamily: 'iconfont');
  static const IconData bag = IconData(0xe617, fontFamily: 'iconfont');
  static const IconData computer = IconData(0xe648, fontFamily: 'iconfont');
  static const IconData profile = IconData(0xe61d, fontFamily: 'iconfont');
  static const IconData message = IconData(0xe69c, fontFamily: 'iconfont');
  static const IconData shop = IconData(0xe602, fontFamily: 'iconfont');
  static const IconData book = IconData(0xe653, fontFamily: 'iconfont');
  static const IconData exam = IconData(0xe61e, fontFamily: 'iconfont');
  static const IconData life = IconData(0xe610, fontFamily: 'iconfont');
}

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: '输入你要发送的信息',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
