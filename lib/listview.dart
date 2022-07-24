import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 500,
          itemBuilder: (context, index) {
            return buildChatItem();
          },
        ));
  }

  Widget buildChatItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://resources.premierleague.com/photos/2022/07/02/d296ae9f-b850-4c6c-9ffe-88ae5658a93a/GettyImages-1396813126.jpg?width=500&height=333"),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mohammed Salah Ahmed Ali",
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Hello how are Hello how are Hello how are ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      " . now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Spacer(),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 10,
          ),
        ],
      ),
    );
  }
}
