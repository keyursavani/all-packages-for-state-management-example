
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class getx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return GetMaterialApp(
     theme: ThemeData(
       primarySwatch: Colors.blueGrey,
     ),
     home: Home(),
   );
  }
}
class Controller extends GetxController{
  var count = 0.obs;

  reset() => count*0+1;
  increment() => count++;
  decrement() => count--;

}

class Home extends StatelessWidget {

  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
        appBar: AppBar(
            title: Text("GetX Package"),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context){
          //         return MyApp();
          //       }),
          //     );
          //   },
          // ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text("Clicks: ${c.count}")),
                SizedBox(height: 10),
                ElevatedButton(
                child: Text("Go to Other"),
                    onPressed: () => Get.to(Other())
                ),
              ],
            ),
        ),
        floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // FloatingActionButton(
            //   child: Icon(Icons.restart_alt),
            //   onPressed: c.reset,
            // ),
            SizedBox(height: 10),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: c.increment,
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: c.decrement,
            ),
            SizedBox(height: 10,),
          ],
        ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
            onPressed: () => Get.to(Home())
        ),
      ),
        body: Center(
            child: Text("${c.count}")
        ),
    );
  }
}