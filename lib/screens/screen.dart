import 'package:flutter/material.dart';

import '../main.dart';

class MyColumn extends StatelessWidget{
  final String img;
  final String title;
  final String description;
  MyColumn(this.img, this.title, this.description);
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
            child: Center(
              child: ImageWidget(img),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
            child: Center(
              child: Text(title),
              ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
            child: Center(
              child: Text(description),
            ),
          ),
        ],
      ),
      width: 400, 
    );
  }
}



class PageTwoMini extends MaterialPageRoute<Null>{
  final String text;
  final Color color;
  PageTwoMini(this.text, this.color): super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        elevation: 1.0,
        title: Text(text),
      ),
      body: ListView(
        children: <Widget>[
          MyColumn("games_icon/numbers/img_1.png", "Обезъяна", "Игра позволяет визуализировать понятие числа, сопоставляя его с количеством предметов. Дети учатся узнавать числа и складывать их, передвигая и складывая ягоды для обезьяны."),
          MyColumn("games_icon/numbers/img_2.png", "Обезъяна", "Игра позволяет визуализировать понятие числа, сопоставляя его с количеством предметов. Дети учатся узнавать числа и складывать их, передвигая и складывая ягоды для обезьяны."),
          MyColumn("games_icon/numbers/img_3.png", "Обезъяна", "Игра позволяет визуализировать понятие числа, сопоставляя его с количеством предметов. Дети учатся узнавать числа и складывать их, передвигая и складывая ягоды для обезьяны."),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  });
}