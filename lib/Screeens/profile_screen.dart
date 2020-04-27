import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dingdong/Screeens/oeder_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/userprovider.dart';
import 'package:flutter_dingdong/model/user.dart';

FirebaseUser loggedInUser;
String content;
User myUser;
String data;
DocumentSnapshot ds3;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(context),
          _orderTitle(),
          _orderType(),
          _bottomList(),
        ],
      ),
    );
  }

  Widget _topHeader(context) {
    DocumentSnapshot searchmyUser(String email) {
      Firestore.instance
          .collection('user')
          .where("email", isEqualTo: email)
          .snapshots()
          .listen(
            (data) => data.documents.forEach(
              (doc) {
                ds3 = doc;
              },
            ),
          );
      return ds3;
    }

    ds = searchmyUser(loggedInUser.email);

    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.lightBlue,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network(
                  'https://img2.woyaogexing.com/2020/04/11/72d7cfc7383b479c9fa696f81d952642!400x400.jpeg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              searchmyUser(loggedInUser.email)['name'],
              style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderInfo()));
        },
        child: ListTile(
          leading: Icon(Icons.list),
          title: Text('我的订单'),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: 750,
      height: 100,
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: 85,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.party_mode,
                  size: 30,
                ),
                Text('待付款')
              ],
            ),
          ),
          //---------------
          Container(
            width: 85,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  size: 30,
                ),
                Text('发货')
              ],
            ),
          ),
          //-------------
          Container(
            width: 85,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  size: 30,
                ),
                Text('待收货')
              ],
            ),
          ),
          //-------------
          Container(
            width: 85,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  size: 30,
                ),
                Text('待评价')
              ],
            ),
          ),
          //-------------
        ],
      ),
    );
  }

  Widget _bottomList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('实名认证'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('同步技能至小程序'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.record_voice_over),
            title: Text('帮助与反馈'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text('举报'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            trailing: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
