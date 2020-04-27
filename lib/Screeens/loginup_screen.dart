import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dingdong/model/myuser.dart';
import 'package:flutter_dingdong/model/user.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/userprovider.dart';

class LoginUpScreen extends StatefulWidget {
  static const String id = 'loginup_screen';
  @override
  _LoginUpScreenState createState() => _LoginUpScreenState();
}

class _LoginUpScreenState extends State<LoginUpScreen> {
  String name, phone, email, password;
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
      body: ModalProgressHUD(
        color: Colors.blue,
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
                          onChanged: (value) {
                            name = value;
                          },
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
                          onChanged: (value) {
                            setState(() {
                              phone = value;
                            });
                          },
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
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -15,
                    child: FlatButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                          print('show spinner is true');
                        });
                        try {
                          Provider.of<UserProvider>(context, listen: false)
                              .addDocument(User(
                                      name: name,
                                      phone: phone,
                                      email: email,
                                      password: password)
                                  .toJson());
                          Firestore.instance.collection('myuser').add(MyUser(
                                  name: name,
                                  email: email,
                                  phone: phone,
                                  password: password,
                                  post: null,
                                  accept: null)
                              .toJson());
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);

                          if (newUser != null) {
                            Navigator.pushNamed(context, LoginScreen.id);
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
              height: 390,
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
