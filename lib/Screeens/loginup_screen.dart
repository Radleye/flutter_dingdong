import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/login_screen.dart';

class LoginUpScreen extends StatelessWidget {
  static const String id = 'loginup_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginUpScreen.id);
          },
          child: Center(
            child: Text(
              '注册',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            child: Text(
              '登录',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '欢迎来到咚咚!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '让我们开始吧',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '用户名',
                            hintStyle: TextStyle(
                              color: Color(0xff444444),
                            ),
                            border: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: '手机号',
                            hintStyle: TextStyle(
                              color: Color(0xff444444),
                            ),
                            border: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '邮箱',
                            hintStyle: TextStyle(
                              color: Color(0xff444444),
                            ),
                            border: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: '密码',
                            hintStyle: TextStyle(
                              color: Color(0xff444444),
                            ),
                            border: OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 15,
                  right: -15,
                  child: FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            height: 390,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 50, spreadRadius: 5),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
