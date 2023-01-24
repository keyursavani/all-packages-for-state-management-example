import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Provider%20Package/data_class.dart';
import 'package:provider_example/main.dart';

class provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ChangeNotifierProvider(create: (context)=> DataClass(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          body: MyHomepage(),
        ),
      ),
    );
  }
}

class MyHomepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomepagestate();
  }
}
class MyHomepagestate extends State<MyHomepage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoping List'),
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
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<DataClass>(builder: (context , dataclass , child){
                    return Text('${dataclass.x}');
                  }),
                  SizedBox(height: 50,),
                  Text("Total"),
                  SizedBox(height: 50,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Provider.of<DataClass>(context , listen:false).increment();
                    },
                    child:Text("+",
                      //   style: TextStyle(
                      //   fontSize: 20,
                      //   color: Colors.white
                      // ),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20 ,color: Colors.white),
                      backgroundColor: Colors.black45,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return nextpage();
                          })
                      );
                    },
                    child:Text("Next Page",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.white
                      // ),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20 ,color: Colors.white),
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class nextpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return nextpagestate();
  }
}
class nextpagestate extends State<nextpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Shoping Cart"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<DataClass>(builder: (context , dataclass , child){
                    return Text('${dataclass.x}');
                  }),
                  SizedBox(height: 50,),
                  Text("Total"),
                  SizedBox(height: 50,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Provider.of<DataClass>(context , listen:false).decrement();
                    },
                    child:Text("-",
                      //   style: TextStyle(
                      //   fontSize: 20,
                      //   color: Colors.white
                      // ),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20 ,color: Colors.white),
                      backgroundColor: Colors.black45,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:Text("Pre Page",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.white
                      // ),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20 ,color: Colors.white),
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}