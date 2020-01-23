import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class MyColumn extends StatelessWidget{
  final String img;
  final String title;
  final String description;
  final Color color;
  MyColumn(this.img, this.title, this.description, this.color);
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Center(
              child: ImageWidget(img),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Center(
              child: Text(title),
              ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Center(
              child: Text(
                description,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: color,
                    letterSpacing: .5
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
      width: 300,
      height: 50,
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
          MyColumn("games_icon/numbers/img_1.png", "Обезъяна", "Игра позволяет визуализировать понятие числа, сопоставляя его с количеством предметов. Дети учатся узнавать числа и складывать их, передвигая и складывая ягоды для обезьяны.", color),
          MyColumn("games_icon/numbers/img_2.png", "Светлячки", "Задача визуализирует числовой ряд, порядок чисел и счет. Дети учатся складывать и вычитать единицами, двойками, тройками и пятерками. Игра дает наглядное понимание алгоритма Евклида, не называя понятий.", color),
          MyColumn("games_icon/numbers/img_3.png", "Айсберги","Эта игра знакомит детей с понятием деления на 2 и 3 нацело и с остатком. Задача ребенка уравновесить льдины, манипулируя различными объектами: чайками, грузами и воздушными шариками. Начиная с простого деления нацело на два, ребенок постепенно переходит к делению с остатком и составлению сложных уравнений. На высоких уровнях ему приходится использовать сложение (грузы и чайки), вычитание (воздушные шарики) и следить за остатком (высаживая чаек в гнездо).", color),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  });
}