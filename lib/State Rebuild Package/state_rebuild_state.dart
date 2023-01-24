import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../main.dart';

class Counter {
  final int value;
  Counter(this.value);

  @override
  String toString() => 'Counter($value)';
}

class ViewModel {
  final counter1 = 0.inj();
  final counter2 = RM.inject<Counter>(
        () => Counter(0),
    undoStackLength: 10,
    debugPrintWhenNotifiedPreMessage: 'counter2',
  );
  int get sum => counter1.state + counter2.state.value;
  incrementCounter1() {
    counter1.state++;
  }
  incrementCounter2() {
    counter2.state = Counter(counter2.state.value + 1);
  }
}

final viewModel = ViewModel();

class CounterApp extends ReactiveStatelessWidget {
  const CounterApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Counter1View(),
            Counter2View(),
            Text('Result: ${viewModel.sum}'),
          ],
        ),
      ),
    );
  }
}

class Counter1View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text('Counter One'),
          onPressed: () => viewModel.incrementCounter1(),
        ),
        SizedBox(height: 15,),
        Text('Counter One Value:- ${viewModel.counter1.state}'),
      ],
    );
  }
}

class Counter2View extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child:  Text('Counter Two'),
          onPressed: () => viewModel.incrementCounter2(),
        ),
        SizedBox(height: 15,),
        Text('Counter Two Value: ${viewModel.counter2.state.value}'),
        SizedBox(height: 50,),
        ElevatedButton(
          child: Text('Undo State'),
          onPressed: () => viewModel.counter2.undoState(),
        ),

      ],
    );
  }
}