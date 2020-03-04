import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dingdong/model/dmeandprovider.dart';
import 'package:flutter_dingdong/model/demand.dart';

class SlideList extends StatelessWidget {
  final Demand demand;
  SlideList({this.demand});
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
                          child: Text(demand.name[0]),
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(demand.name),
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
                      demand.content,
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
                        "江苏省淮安市淮阴工学院南苑22栋",
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
          caption: '更多',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () {},
        ),
        IconSlideAction(
          caption: '删除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            await demandProvider.removeDocument(demand.id1);
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
