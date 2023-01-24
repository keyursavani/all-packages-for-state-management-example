import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';

class fluttercommand extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<fluttercommand> {
  late int counter = 0;
  /// This command does not expect any parameters when called therefore TParam
  /// is void and publishes its results as String
  // Command<void, String> _incrementCounterCommand;
  //
  // _MyHomePageState(){
  //   _incrementCounterCommand = Command.createSyncNoParam((){
  //     counter++;
  //     return counter.toString();
  //   }, '0');
  // }

  // _MyHomePageState() {
  //   _incrementCounterCommand = Command.createSyncNoParam(() {
  //     counter++;
  //     return counter.toString();
  //   }, '0');
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Flutter Commands Package"),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(
             'You have pushed the button this many times:',
           ),
           // ValueListenableBuilder<String>(
           //     valueListenable: _incrementCounterCommand,
           //     builder: (context, val, _) {
           //       return Text(
           //         val,
           //         style: Theme.of(context).textTheme.headline4,
           //       );
           //     }),
         ],
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){},
       // _incrementCounterCommand,
       tooltip: 'Increment',
       child: Icon(Icons.add),
     ), // This trailing comma makes auto-formatting nicer for build methods.
   );
  }
}