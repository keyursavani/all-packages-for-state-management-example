
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// void get1(){
//   setupLocator();
//   runApp(getlt());
// }

class getlt extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return getltstate();
  }
}
class getltstate extends State<getlt>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
      appBar: AppBar(
        title: Text("Gelt Package Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Some Data"),
            SizedBox(height: 10,),
            Text("Some More Data"),
            SizedBox(height: 10,),
            MyCustomeWidget1(),
            SizedBox(height: 10,),
            MyCustomeWidget2(),
          ],
        ),
      ),
    );
  }
}

class MyCustomeWidget1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text("My Custom Widget One"),
    );
  }
}

class MyCustomeWidget2 extends StatelessWidget{
  final instance = locator<APIService>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     child: Text(instance.fetchData),
   );
  }
}
class APIService {
  String  get  fetchData => 'My Custom Widget Two && Data From API';
}

GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerFactory(() => APIService());
}