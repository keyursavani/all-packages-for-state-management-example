import 'package:binder/binder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

final counterRef = StateRef(0);
final counterViewLogicRef = LogicRef((scope) => CounterViewLogic(scope));

class CounterViewLogic with Logic {
  const CounterViewLogic(this.scope);

  @override
  final Scope scope;

  void increment() => write(counterRef, read(counterRef) + 1);
  void decrement() => write(counterRef, read(counterRef) - 1);
  void reset() => write(counterRef, read(counterRef) * 0 +0);
}

class binder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BinderScope(
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: CounterView(),
        ),
    );
  }
}


class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.watch(counterRef);
    return Scaffold(
      appBar: AppBar(
          title: Text('Binder example'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$counter', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.use(counterViewLogicRef).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: () => context.use(counterViewLogicRef).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: () => context.use(counterViewLogicRef).reset(),
            tooltip: 'Reset',
            child: const Icon(Icons.restart_alt),
          ),
        ],
      ),
    );
  }
}