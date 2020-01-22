import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funexpected math',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
      ),
      // home: MyHomePage(title: 'List of games'),
      home: MyPage("Funexpected"),
    );
  }
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
          Center(
            child: Text(text),
            ),
          ],
      ),
      color: color,
      height: 200,
    );
  }
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
