import 'package:flutter/material.dart';

class CreationPage extends StatefulWidget{
  final title;
  CreationPage({this.title});
  @override
  State<StatefulWidget> createState() {
    return CreationPageState();
  }

}

class CreationPageState extends State<CreationPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
           child:  new Text(widget.title),
        ),
        elevation: 3,
      ),
    );
  }

}
