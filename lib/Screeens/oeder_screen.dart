import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dingdong/Screeens/accept_screen.dart';
import 'package:flutter_dingdong/Screeens/post_screen.dart';
import 'addtask_screen.dart';

class OrderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('任务详情'),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _topSelect(context),
          ],
        ),
      ),
    );
  }

  Widget _topSelect(context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AcceptScreen()));
              },
              child: Text('发布的请求'),
            ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostScreen()));
              },
              child: Text('接受的请求'),
            ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              child: Text('评价'),
            ),
          ),
        ],
      ),
    );
  }
}
