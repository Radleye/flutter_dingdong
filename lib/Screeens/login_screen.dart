import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/index.dart';
import 'package:flutter_dingdong/Screeens/loginup_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
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
            onPressed: () {},
            child: Text(
              '登录',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
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
                        '欢迎回来!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '身份验证',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 13),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
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
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          '忘记密码？',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -15,
                    child: FlatButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                          print(showSpinner);
                        });

                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Index()));
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
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
              height: 275,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 50, spreadRadius: 5),
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
      ),
    );
  }
}
