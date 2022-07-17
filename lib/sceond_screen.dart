import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [];
    for (int i = 1; i <= 1000; i++) {
      // Color color;
      // if (i % 2 == 0) {
      //   color = Colors.blue;
      // } else {
      //   color = Colors.green;
      // }
      texts.add(Text(
        "i $i",
        style: TextStyle(
            fontSize: 33,
            fontWeight: (i % 2 == 0) ? FontWeight.w900 : FontWeight.w400,
            color: (i % 2 == 0) ? Colors.blue : Colors.green,),
      ));
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: texts,
            ),
          ),
        ),
      ),
    );
  }
}
