import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dingdong/constants/myIcon.dart';
import 'package:flutter_dingdong/model/demand.dart';
import 'package:flutter_dingdong/model/dmeandprovider.dart';
import 'package:flutter_dingdong/model/userprovider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_dingdong/model/user.dart';
import 'package:flutter_dingdong/widgets/slidelist.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String content;
User myUser;
Demand demand;

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
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
    List<Demand> demands;
    TextEditingController _contentController = TextEditingController();
    final userprovider = Provider.of<UserProvider>(context);
    final demandProvider = Provider.of<DemandProvider>(context);
    String getUser() {
      DocumentSnapshot ds = userprovider.searchUser(loggedInUser.email);
      print(ds['name'].toString());
      return ds['name'].toString();
    }

    String getNumber() {
      DocumentSnapshot ds = userprovider.searchUser(loggedInUser.email);

      return ds['phone'].toString();
    }

    String name = getUser();
    String phone = getNumber();

    return Scaffold(
        appBar: AppBar(
          leading: Text(''),
          centerTitle: true,
          title: Text('需求发布'),
          actions: <Widget>[
            IconButton(
              icon: Icon(MyIcon.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      color: Colors.blue,
                      child: Container(
                        height: 300,
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: GestureDetector(
                                    child: Icon(Icons.close),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                ),
                              ],
                            ),
                            Container(
                              height: 120,
                              margin:
                                  EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: TextField(
                                controller: _contentController,
                                decoration: InputDecoration(
                                  hintText: '请输入您的需求',
                                  hintStyle: TextStyle(
                                      color: Color(0xff999999),
                                      fontWeight: FontWeight.w500),
                                  fillColor: Color(0xffF4F4F4),
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 50),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    '金额: ¥0.00',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 10),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  color: Color(0xffF4F4F4),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 150,
                              child: FlatButton(
                                color: Colors.blue,
                                onPressed: () {
                                  setState(() async {
                                    content = _contentController.text;
                                    await demandProvider.addDocument(
                                      Demand(
                                        name: name,
                                        content: content,
                                        phone: phone,
                                      ).toJson(),
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text(
                                  '发送',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: demandProvider.streamDataCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              demands = snapshot.data.documents
                  .map(
                    (doc) => Demand.fromJson(doc.data, doc.documentID),
                  )
                  .toList();
              return ListView.builder(
                  itemCount: demands.length,
                  itemBuilder: (context, index) {
                    return SlideList(
                      demand: demands[index],
                      /*
                      name: demands[index].name,
                      content: demands[index].content,
                      phone: demands[index].phone,
                       */
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}

/*
*     ListTile(
                      title: Text(demands[index].name),
                      subtitle: Text(demands[index].content),
                    );
*
*
* */
