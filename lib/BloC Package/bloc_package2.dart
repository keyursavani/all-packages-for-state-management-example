import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';
// import 'package:youtubevides/counter_bloc.dart';

class bloc3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: bloc2(),
      ),
    );
  }
}

class bloc2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bloc2state();
  }
}

class bloc2state extends State<bloc2> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BloC Package Example"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return MyApp();
              }),
            );
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(builder: (context, state) {
          return Text(
            '$state',
            style: TextStyle(
              fontSize: 36.0,
            ),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "1",
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(CounterEvent.Increment);
              }),
          SizedBox(height: 15),
          FloatingActionButton(
              heroTag: "1",
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterEvent.Decrement);
              }),
          SizedBox(height: 15),
          FloatingActionButton(
              heroTag: "1",
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.restart_alt),
              onPressed: () {
                counterBloc.add(CounterEvent.Reset);
              }),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

enum CounterEvent { Increment, Decrement, Reset }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.Increment:
        yield state + 1;
        break;
      case CounterEvent.Decrement:
        yield state - 1;
        break;
      case CounterEvent.Reset:
        yield state * 0 + 0;
        break;
    }
  }
}
