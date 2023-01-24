import 'package:flutter/material.dart';
import 'package:provider_example/Binder%20Package/binder_package.dart';
import 'package:provider_example/Provider%20Package/provider_package.dart';
import 'package:provider_example/Redux%20Package/redux_package.dart';
import 'package:provider_example/Riverpod%20Package/riverpod_package.dart';
import 'package:provider_example/Set%20State%20Package/set_state_method.dart';

import 'Flutter Commands Package/flutter_command_package.dart';
import 'GetX Package/getx_package.dart';
import 'MobX Package/mobx_package.dart';
import 'BloC Package/bloc_package.dart';
import 'BloC Package/bloc_package2.dart';
import 'GetIt Package/getlt_package.dart';
import 'Inherit Package/inherit_widget.dart';
import 'State Rebuild Package/state_rebuild_state.dart';
import 'Triple Pattern Package/triple_pattern_Package.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     theme: ThemeData(
       primarySwatch: Colors.blueGrey,
     ),
     home:myhomepage(),
   );
  }
}
class myhomepage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myhomepagestate();
  }
}
class myhomepagestate extends State<myhomepage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Different State Management Packages"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return provider();
                              }),
                            );
                          },
                          child: Text("Provider Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15 ,color: Colors.black),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return riverpod();
                              }),
                            );
                          },
                          child: Text("Riverpod Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return setstate();
                              }),
                            );
                          },
                          child: Text("Set State Method"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15 ,color: Colors.black),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return inherit();
                              }),
                            );
                          },
                          child: Text("Inherit Widget"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return reduxpackage();
                              }),
                            );
                          },
                          child: Text("Redux Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15 ,color: Colors.black),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return bloc3();
                              }),
                            );
                          },
                          child: Text("Bloc Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return getlt();
                              }),
                            );
                          },
                          child: Text("GetIt Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15 ,color: Colors.black),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return mobx();
                              }),
                            );
                          },
                          child: Text("MobX Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return triplepattern();
                              }),
                            );
                          },
                          child: Text("Triple Pattern Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15 ,color: Colors.black),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return binder();
                              }),
                            );
                          },
                          child: Text("Binder Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return getx();
                              }),
                            );
                          },
                          child: Text("GetX Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15 ,color: Colors.black),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return CounterApp();
                              }),
                            );
                          },
                          child: Text("State Rebuild Package"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
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

