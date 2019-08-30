import 'package:fancyfab/screens/fancy_fab.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Fab Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyHomeState();
  }

}

class MyHomeState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fancy Fab Demo"),
      ),
      body: new Container(
        height: size.height,
        width: size.width,
        decoration: new BoxDecoration(color: Colors.cyanAccent[50]),
        child: new Center(
          child: new Text("This is Fancy Fab Button Demo..."),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FancyFab(),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.blueGrey,
        child: new Container(
          height: 50,
        ),
    )
    );
  }

}