import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/main.dart';

class riverpod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyhomePage1(),
      ),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyhomePage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod Package Example"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
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
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'value: $value',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        ref.read(counterStateProvider.state).state++;
                      },
                      child: Icon(Icons.add),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        ref.read(counterStateProvider.state).state--;
                      },
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
