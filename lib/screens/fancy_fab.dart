import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'dart:math';

import 'create.dart';

class FancyFab extends StatefulWidget {

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with TickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  AnimationController _animationControllerIcon;
  Animation<double> _animateIcon;
  Animation<int> _animateText;
  Animation<double> translation;
  Animation<double> scale;
  Curve _curve = Curves.easeOut;
  bool isFloatingButtonPressed = false;
  Map<int,String> images = Map<int,String>();

  @override
  initState() {
    images = {
    };
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    _animationControllerIcon =
    AnimationController(vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 45.0).animate(_animationControllerIcon);

    _animateText = IntTween(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.9,
        1.0,
        curve: _curve,
      ),
    ));

    scale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        1.0,
        curve: _curve,
      ),
    ));
    translation = Tween<double>(
      begin: 0,
      end: 110,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    _animationControllerIcon.dispose();
    super.dispose();
  }

  animate() {
    isFloatingButtonPressed=!isFloatingButtonPressed;
    if(isFloatingButtonPressed)
      _animationControllerIcon.forward();
      else
      _animationControllerIcon.reverse();
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget first() {
    return Container(
      width:75*scale.value,
      height: 75*scale.value,
      child: FloatingActionButton(
        heroTag: "first",
        onPressed: (){
          animate();
          Navigator.push(context, MaterialPageRoute(builder: (context) => new CreationPage(title: "First")));
        },
        backgroundColor: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Visibility(child: new Text("First", style: new TextStyle(color: new Color(0xFF455A64), fontSize: 14, fontWeight: FontWeight.bold)),visible: _animateText.value==0?false:true,),
          ],
        )
      ),
    );
  }

Widget second() {
    return Container(
      width:75*scale.value,
      height: 75*scale.value,
      child: FloatingActionButton(
        heroTag: "second",
        onPressed: (){
          animate();
          Navigator.push(context, MaterialPageRoute(builder: (context) => new CreationPage(title: "Second")));
        },
        backgroundColor: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Visibility(child: new Text("Second", style: new TextStyle(color: new Color(0xFF455A64),  fontSize: 14, fontWeight: FontWeight.bold)),visible: _animateText.value==0?false:true,),
          ],
        )

      ),
    );
  }

  Widget third() {
    return Container(
      width:75*scale.value,
      height: 75*scale.value,
      child: FloatingActionButton(
        heroTag: "third",
        onPressed: (){
          animate();
          Navigator.push(context, MaterialPageRoute(builder: (context) => new CreationPage(title: "Third")));
        },
        backgroundColor: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Visibility(child: new Text("Third", style: new TextStyle(color: new Color(0xFF455A64), fontSize: 14, fontWeight: FontWeight.bold)),visible: _animateText.value==0?false:true,),
          ],
        ),

      ),
    );
  }

  Widget forth() {
    return Container(
      width:75*scale.value,
      height: 75*scale.value,
      child: FloatingActionButton(
        heroTag: "forth",
        onPressed: (){
          animate();
          Navigator.push(context, MaterialPageRoute(builder: (context) => new CreationPage(title: "Forth")));
        },
        backgroundColor: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Visibility(child: new Text("Forth", style: new TextStyle(color: new Color(0xFF455A64), fontSize: 14, fontWeight: FontWeight.bold)),visible: _animateText.value==0?false:true,),
          ],
        ),
      ),
    );
  }


  Widget toggle() {
    return new Container(
        width:75,
        height: 75,
        margin: new EdgeInsets.only(bottom: 15),
        decoration: new BoxDecoration(border: Border.all(color: Colors.white,width: 5), borderRadius: BorderRadius.circular(40),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: animate,
          heroTag: "toggle",
          child:
          new RotationTransition(
            turns: new AlwaysStoppedAnimation( _animateIcon.value/ 360),
            child: new Icon(Icons.add,color: Colors.white),
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, builder){
          return new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Expanded(
                flex:1,
                child: new Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Transform(
                        transform: Matrix4.identity()..translate(
                          (translation.value) *1.75/4* cos(radians(0)),
                          (translation.value) *3/4* cos(radians(180)),
                        ),
                        child:second()),
                    Transform(
                        transform: Matrix4.identity()..translate(
                          (translation.value) * cos(radians(0)),
                          (translation.value) * cos(radians(100)),

                        ),
                        child:first()),
                    Transform(
                        transform: Matrix4.identity()..translate(
                          (translation.value) *1.75/4* cos(radians(180)),
                          (translation.value) *3/4* cos(radians(180)),

                        ),
                        child:third()),
                    Transform(
                        transform: Matrix4.identity()..translate(
                          (translation.value) * cos(radians(180)),
                          (translation.value) * cos(radians(260)),

                        ),
                        child:forth()),
                    toggle(),
                  ],
                )
              )
            ],
          );
        });
  }
}