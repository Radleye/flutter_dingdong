import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dingdong/constants/myIcon.dart';
import 'package:flutter_dingdong/model/demand.dart';
import 'package:flutter_dingdong/model/dmeandprovider.dart';
import 'package:flutter_dingdong/model/myuser.dart';
import 'package:flutter_dingdong/model/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/user.dart';
import 'package:flutter_dingdong/widgets/slidelist.dart';
import 'package:amap_location/amap_location.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
DocumentSnapshot ds6;
String content;
User myUser;
Demand demand;
String result;
final CollectionReference dbf = Firestore.instance.collection('myuser');

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AMapLocationClient.shutdown();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    getLocation();
  }

  getLocation() async {
    // 申请权限
    await AMapLocationClient.startup(AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    var res = await AMapLocationClient.getLocation(true);
    result = res.formattedAddress.toString();
    AMapLocationClient.startLocation();
    print(res.formattedAddress);
    print(result);
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

  DocumentSnapshot searchmyUser(String email) {
    Firestore.instance
        .collection('myuser')
        .where("email", isEqualTo: email)
        .snapshots()
        .listen(
          (data) => data.documents.forEach(
            (doc) {
              ds6 = doc;
            },
          ),
        );
    return ds6;
  }

  @override
  Widget build(BuildContext context) {
    List<Demand> demands;
    TextEditingController _contentController = TextEditingController();
    final userprovider = Provider.of<UserProvider>(context);
    final demandProvider = Provider.of<DemandProvider>(context);
    /* String getUser() {
      return ;
    }

    String getNumber() {
      return ;
    }

    String name = getUser();
    String phone = getNumber();
*/
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
                                    '金额¥0.00元',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 10),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  color: Color(0xffF4F4F4),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    '地址：$result',
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
                                  setState(() {
                                    DocumentSnapshot ds1 =
                                        searchmyUser(loggedInUser.email);
                                    print(ds1['name']);

                                    content = _contentController.text;
                                    demandProvider.addDocument(
                                      Demand(
                                        name: userprovider.searchUser(
                                            loggedInUser.email)['name'],
                                        content: content,
                                        phone: userprovider.searchUser(
                                            loggedInUser.email)['phone'],
                                        address: result,
                                      ).toJson(),
                                    );
                                    DocumentSnapshot ds2 =
                                        searchmyUser(loggedInUser.email);
                                    print(ds2.documentID);
                                    print(ds2['name']);
                                    ds2.reference.collection('posts').add(
                                        Accept(
                                                id: null,
                                                sender: userprovider.searchUser(
                                                    loggedInUser.email)['name'],
                                                content: content,
                                                senderphone: userprovider
                                                    .searchUser(loggedInUser
                                                        .email)['phone'])
                                            .toJson());

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
