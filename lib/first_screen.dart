import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
   FirstScreen({Key? key}) : super(key: key);

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          print(counter);
        },
        child: Icon(Icons.add,),
      ),
      body:  Center(
        child: Text(
          "Counter : $counter",
          style: TextStyle(
            fontSize: 44
          ),
        ),
      ),
    );
  }
}
