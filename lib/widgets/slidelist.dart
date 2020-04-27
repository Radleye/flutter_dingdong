import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/dmeandprovider.dart';
import 'package:flutter_dingdong/model/demand.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dingdong/Screeens/addtask_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dingdong/model/myuser.dart';
import 'package:flutter_dingdong/model/user.dart';

FirebaseUser loggedInUser;
User myUser;

class SlideList extends StatefulWidget {
  final Demand demand;
  SlideList({this.demand});

  @override
  _SlideListState createState() => _SlideListState();
}

class _SlideListState extends State<SlideList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;
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
    final demandProvider = Provider.of<DemandProvider>(context);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          color: Color(0xffF0F1F3),
          child: Container(
            margin: EdgeInsets.all(10),
            height: 160,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 8, right: 8, bottom: 18),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.indigoAccent,
                          child: Text(widget.demand.name[0]),
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.demand.name),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: double.infinity,
                    child: Text(
                      widget.demand.content,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.gps_not_fixed,
                        size: 10,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.demand.address,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '接受',
          color: Colors.black45,
          icon: Icons.change_history,
          onTap: () async {
            DocumentSnapshot ds2 = searchmyUser(loggedInUser.email);
            print(ds2.documentID);
            print(ds2['name']);
            print(widget.demand.content.toString());
            ds2.reference.collection('accepts').add(Accept(
                    id: null,
                    sender: widget.demand.name,
                    content: widget.demand.content,
                    senderphone: widget.demand.phone)
                .toJson());
            await demandProvider.removeDocument(widget.demand.id1);
          },
        ),
        IconSlideAction(
          caption: '删除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            await demandProvider.removeDocument(widget.demand.id1);
            print('delete succesful');
          },
        ),
      ],
    );
  }
}

/*
ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text(name[0]),
            foregroundColor: Colors.white,
          ),
          title: Text(name),
          subtitle: Text(content),
        ),


 */
