

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class setstate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return state();
  }
}
class state extends State<setstate>{
  int x = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Set State Example"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'value: $x',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          x++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          x--;
                        });
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
