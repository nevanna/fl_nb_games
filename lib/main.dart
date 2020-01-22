
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:nb_games/screens/screen.dart";
// void main() => runApp(MyApp());

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



// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Funexpected math',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
        
//       ),
//       // home: MyHomePage(title: 'List of games'),
      
//     );
//   }
// }

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

// class MyScreen extends MaterialPageRoute<Null>{
//   MyScreen(this.title, this.color);
//   final String title;
//   final dynamic color;
//     :super(builder : (BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: color,
//       ),
//     );
//   }
// }

class TryGes extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
     child: GestureDetector(
       onTap: () {
         print("Cliked");
         Navigator.push(context, PageTwo());
       },
       child: Container(
         height: 70.0,
         width: 100.0,
         padding: EdgeInsets.all(20),
         decoration: BoxDecoration(
           color: Colors.purpleAccent,
           borderRadius: BorderRadius.circular(15),
         ),
         child: Text("Click me!"),
       ),
     ),
    );
  }
}


class PageTwo extends MaterialPageRoute<Null>{
  PageTwo(): super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 1.0,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, PageThree());
          },
          child: Text("Go to page Three") ,
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
        title: new Text(name),
        ),

      body: ListView(
       children: [
         MyRaw("Logic", Colors.green, "images/logic.png"),
         MyRaw("Numbers", Colors.red, "images/numbers.png"),
         MyRaw("Geometry", Colors.blue, "images/geometry.png"),
         MyRaw("Programming", Colors.orange, "images/programming.png"),
         MyRaw("Puzzle", Colors.deepPurple, "images/puzzle.png"),
         TryGes(),
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


