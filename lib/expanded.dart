import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            // 3 / 6
            Expanded(
              flex: 3,
              child: Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  color: Colors.green,
                  child: Text("Hello")),
            ),
            Expanded(
              child: Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  color: Colors.red,
                  child: Text("Hello")),
            ),
            Expanded(
              child: Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text("Hello")),
            ),
            Expanded(
              child: Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  color: Colors.black,
                  child: Text("Hello")),
            ),
          ],
        ),
      ),
    );
  }
}
