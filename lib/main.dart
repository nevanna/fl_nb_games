
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:nb_games/screens/screen.dart";


Map<int, Color> color =
{
50:Color.fromRGBO(106, 90, 201, .1),
100:Color.fromRGBO(106, 90, 201, .2),
200:Color.fromRGBO(106, 90, 201, .3),
300:Color.fromRGBO(106, 90, 201, .4),
400:Color.fromRGBO(106, 90, 201, .5),
500:Color.fromRGBO(106, 90, 201, .6),
600:Color.fromRGBO(106, 90, 201, .7),
700:Color.fromRGBO(106, 90, 201, .8),
800:Color.fromRGBO(106, 90, 201, .9),
900:Color.fromRGBO(106, 90, 201, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF6A5AC9, color);


void main(){
  runApp( MaterialApp(
    title: 'Funexpected math',
    theme: ThemeData(
      primarySwatch: colorCustom,
      ),
    home: MyPage("Funexpected"),
    debugShowCheckedModeBanner: false,
    ));
}

class ImageWidget extends StatelessWidget{
  ImageWidget(this.file_name);
  final String file_name;

  @override
  Widget build(BuildContext context){
    return Image.asset(file_name,);
  }
}

void _launchURL()async{
  const url = "https://funexpectedapps.com/";
  if (await canLaunch(url)){
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}

class MyRaw extends StatelessWidget{
  MyRaw(this.text, this.color, this.image_name);
  final dynamic color;
  final String text;
  final String image_name;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        children: [
          ImageWidget(image_name),
          Padding(
            padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
            child: Center(
              child: Text(text),
              ),
            ), 
          ],
      ),
      color: color,
      height: 200,
    );
  }
}


class TryGes extends StatelessWidget{
  final String title;
  final dynamic color;
  final dynamic image;
  TryGes(this.title, this.color, this.image);
  @override
  Widget build(BuildContext context){
    return Container(
     child: GestureDetector(
       onTap: () {
         print("Cliked");
         Navigator.push(context, PageTwoMini(title, color));
       },
       child: MyRaw(title, color, image),
     ),
    );
  }
}



class Minigames{
  final String category;
  final String img;
  final String name;
  final Color color;
  final String body;
  Minigames(this.category, this.img,this.name, this.color, this.body);
}

class PageTwo extends MaterialPageRoute<Null>{
  final String text;
  final Color color;
  PageTwo(this.text, this.color): super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        elevation: 1.0,
        title: Text(text),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, PageThree());
          },
          child: Text(text) ,
        ),
      ),
    );
  });
}

class PageThree extends MaterialPageRoute<Null>{
  PageThree():super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Page!"),
        backgroundColor: Colors.yellowAccent.shade400,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text("go home"),
        ),
        ),
    );
  });
}

class MyPage extends StatelessWidget{
  MyPage(this.name);
  final String name;
  

  @override
  Widget build(BuildContext context) { // [context] будет описан позже
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 2.0,
        title: new Text(name),
        ),

      body: ListView(
       children: [
         TryGes("Logic", Colors.green, "images/logic.png"),
         TryGes("Numbers", Colors.red, "images/numbers.png"),
         TryGes("Geometry", Colors.blue, "images/geometry.png"),
         TryGes("Programming", Colors.orange, "images/programming.png"),
         TryGes("Puzzle", Colors.deepPurple, "images/puzzle.png"),
         ],
         scrollDirection: Axis.vertical,
         reverse: false,
         addAutomaticKeepAlives: true,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        tooltip: 'URL',
        backgroundColor: colorCustom,
        child: Icon(Icons.mood),
        splashColor: Colors.red,
      ),
    );
  }

}


