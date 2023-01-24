import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:provider_example/main.dart';

class inherit extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     theme: ThemeData(
       primarySwatch: Colors.blueGrey,
     ),
     home: InheritedWidgetExample(),
   );
  }
}

class CountModel extends InheritedWidget{
  CountModel({required this.count, child}) : super(child: child);
 final int count;
  @override
  bool updateShouldNotify(CountModel oldWidget) {
    // TODO: implement updateShouldNotify
    if(oldWidget.count != count){
      return true;
    }
    return false;
  }
  static CountModel of(BuildContext context) =>
   context.dependOnInheritedWidgetOfExactType<CountModel>() as CountModel;

}

class InheritedWidgetExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Counter(),
    );
  }
}
class Counter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterState();
  }
}
class CounterState extends State<Counter>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritWidget Example"),
        leading: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return MyApp();
                }),
              );
            },
            icon:Icon(Icons.arrow_back),
        ),
      ),
      body: CountModel(
        count: count,
        child: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               CounterText(),
               CounterText2(),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              onPressed: (){
                setState(() {
                  ++count;
                });
          },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Container(
              // color: Colors.black26,
            ),
          ),
          FloatingActionButton(
              onPressed: (){
                setState(() {
                  --count;
                });
              },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   CountModel model = CountModel.of(context);
   return Text('Count: ${model.count}', style: TextStyle(
     color: Colors.green,fontSize: 30),
   );
  }
}

class CounterText2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    CountModel model = CountModel.of(context);
    return Text('Count: ${model.count}', style: TextStyle(
        color: Colors.deepOrange,fontSize: 30),
    );
  }
}