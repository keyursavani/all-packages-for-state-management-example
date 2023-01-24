import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider_example/Set%20State%20Package/set_state_method.dart';
import 'package:redux/redux.dart';

import '../main.dart';

class reduxpackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = new Store<AppState>(
      appStateReducer,
      initialState: AppState.initial(),
    );
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: redux(),
        ));
  }
}

class redux extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return reduxstate();
  }
}

class reduxstate extends State<redux> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux Package Example"),
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
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'value:',
                ),
                Text(
                  viewModel.count.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => viewModel.onIncrement(),
                  tooltip: 'Increment',
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
                  onPressed: () => viewModel.onDecrement(),
                  tooltip: 'Increment',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class Counter {
  int counter;

  Counter(this.counter);
}

class AppState {
  final Counter counter;

  AppState(this.counter);

  AppState.initial() : counter = new Counter(0);
}

class IncrementAction {
  final int count;

  IncrementAction(this.count);
}
class DecrementAction {
  final int count;

  DecrementAction(this.count);
}

AppState appStateReducer(AppState state, dynamic action) {
  if (action is IncrementAction) {
    return new AppState(new Counter(action.count));
  }
  else if(action is DecrementAction){
    return new AppState(new Counter(action.count));
  }
  return state;
}

class ViewModel {
  int count;
  final Function() onIncrement;
  final Function() onDecrement;

  ViewModel(this.count, this.onIncrement, this.onDecrement);

  factory ViewModel.create(Store<AppState> store) {
    _onIncrement() {
      print("Incrementing");
      print(store.state.counter.counter.toString());
      store.dispatch(new IncrementAction(store.state.counter.counter += 1));
    }
    _onDecrement() {
      print("Decrementing");
      print(store.state.counter.counter.toString());
      store.dispatch(new IncrementAction(store.state.counter.counter -= 1));
    }
    return ViewModel(store.state.counter.counter, _onIncrement , _onDecrement);

  }
}

// class ViewModel2 {
//   int count;
//   final Function() onDecrement;
//
//   ViewModel2(this.count, this.onDecrement);
//
//   factory ViewModel2.create(Store<AppState> store) {
//     _onDecrement() {
//       print("Idecrementing");
//       print(store.state.counter.counter.toString());
//       store.dispatch(new DecrementAction(store.state.counter.counter -= 1));
//     }
//
//     return ViewModel2(store.state.counter.counter, _onDecrement);
//   }
// }
