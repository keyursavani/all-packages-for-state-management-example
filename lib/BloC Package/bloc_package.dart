
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class bloc extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return blocstate();
  }
}

class blocstate extends State<bloc>{
  int _counter =0;
  final counterBloc = CounterBloc();

  @override
  void dispose(){
    counterBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar:AppBar(
       title: Text("BloC Package"),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Value:-"),
           StreamBuilder(
             stream: counterBloc.counterStream,
               initialData: 0,
               builder: (context, snapshot){
               return Text('${snapshot.data}', style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),);
               }
           ),
         ],
       ),
     ),
     floatingActionButton: Row(
       children: [
         SizedBox(width: 50,),
         FloatingActionButton(
           onPressed: (){
             _counter++;
             counterBloc.counterSink.add(_counter);
             // counterBloc.eventSink.add(CounterAction.Increment);
           },
           tooltip: 'Increment',
           child: Icon(Icons.add),
         ),
         SizedBox(width: 50,),
         FloatingActionButton(
           onPressed: (){
             _counter--;
             counterBloc.counterSink.add(_counter);
             // counterBloc.eventSink.add(CounterAction.Increment);
           },
           tooltip: 'Decrement',
           child: Icon(Icons.remove),
         ),
         SizedBox(width: 50,),
         FloatingActionButton(
           onPressed: (){
             _counter = 0;
             counterBloc.counterSink.add(_counter);
             // counterBloc.eventSink.add(CounterAction.Increment);
           },
           tooltip: 'Reset',
           child: Icon(Icons.restart_alt),
         ),
       ],
     ),
   );
  }
}
enum CounterAction{ Increment, Decrement, Reset}
class CounterBloc   {

  late int counter;

  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterBloc>();
  StreamSink<CounterBloc> get eventSink => _eventStreamController.sink;
  Stream<CounterBloc> get eventStream => _eventStreamController.stream;

  CounterBloc(){

    counter = 0;

    counterStream.listen((event) {});

    eventStream.listen((event) {
      if(event == CounterAction.Increment)
        counter++;
      else if(event == CounterAction.Decrement)
        counter--;
      else if(event == CounterAction.Reset)
        counter = 0;

      counterSink.add(counter);
    });
  }
  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }
}