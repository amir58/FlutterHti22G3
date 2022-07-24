import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 350,
                  height: 350,
                  color: Colors.black,
                ),
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.green,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://resources.premierleague.com/photos/2022/07/02/d296ae9f-b850-4c6c-9ffe-88ae5658a93a/GettyImages-1396813126.jpg?width=500&height=333"),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 13,
                  child: Icon(Icons.double_arrow, color: Colors.white,),
                  backgroundColor: Colors.blue,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
