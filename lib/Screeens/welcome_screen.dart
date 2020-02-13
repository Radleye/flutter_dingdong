import 'package:flutter/material.dart';
import 'package:flutter_dingdong/Screeens/login_screen.dart';
import 'package:flutter_dingdong/Screeens/loginup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            margin: EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '咚咚',
                  style: TextStyle(
                      fontSize: 55,
                      fontFamily: 'ZCOOLXiaoWei',
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 310,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18),
                  child: Text(
                    '欢迎光临!',
                    style: TextStyle(
                        fontFamily: 'XiaoDouDaoMoMoZhiCaoShuJian',
                        color: Colors.blue,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.only(bottom: 10),
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: OutlineButton(
                    highlightColor: Colors.blue,
                    borderSide: BorderSide(color: Colors.lightBlue),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginUpScreen.id);
                    },
                    child: Text(
                      '注册',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
