import 'package:flutter/material.dart';
import 'package:flutter_dingdong/constants/myIcon.dart';

class categorItem extends StatelessWidget {
  final IconData myIcon;
  final Function onPress;
  final String text;
  categorItem({this.myIcon, this.onPress, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 12, bottom: 8),
            height: 75,
            width: 75,
            child: FloatingActionButton(
              heroTag: text,
              backgroundColor: Colors.white,
              onPressed: onPress,
              shape: CircleBorder(),
              child: Icon(
                myIcon,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

class TopCategories extends StatelessWidget {
  final topText = Padding(
    padding: EdgeInsets.only(top: 10, left: 15, right: 8, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '所有种类',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Text(
          '更多 >',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
  final topCategories = Padding(
      padding: EdgeInsets.only(left: 1),
      child: SizedBox(
        height: 110,
        child: ListView(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            categorItem(
              myIcon: MyIcon.exam,
              onPress: () {},
              text: '考研书籍',
            ),
            categorItem(
              myIcon: MyIcon.book,
              onPress: () {},
              text: '教材书籍',
            ),
            categorItem(
              myIcon: MyIcon.computer,
              onPress: () {},
              text: '电子设备',
            ),
            categorItem(
              myIcon: MyIcon.life,
              onPress: () {},
              text: '生活用品',
            ),
            categorItem(
              myIcon: MyIcon.life,
              onPress: () {},
              text: '生活用',
            ),
          ],
        ),
      ));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          topText,
          topCategories,
        ],
      ),
    );
  }
}
