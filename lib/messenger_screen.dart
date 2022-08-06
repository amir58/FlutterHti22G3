import 'package:flutter/material.dart';
import 'package:hti22three/widgets/app_circle_icon_button.dart';

class MessengerScreen extends StatelessWidget {
  MessengerScreen({Key? key}) : super(key: key);

  List<ChatData> chatsData = [
    ChatData(
      imageUrl:
          "https://resources.premierleague.com/photos/2022/07/02/d296ae9f-b850-4c6c-9ffe-88ae5658a93a/GettyImages-1396813126.jpg?width=500&height=333",
      username: "Amir",
      message: "hello",
      dateTime: "10 m",
      online: false,
      opened: false,
    ),
    ChatData(
      imageUrl:
          "https://resources.premierleague.com/photos/2022/07/02/d296ae9f-b850-4c6c-9ffe-88ae5658a93a/GettyImages-1396813126.jpg?width=500&height=333",
      username: "Ali",
      message: "Hi where are you",
      dateTime: "now",
      online: true,
      opened: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: [
              buildCustomAppBar(),
              buildCustomSearch(),
              buildStoriesRow(),
              Expanded(
                child: ListView.separated(
                  itemCount: chatsData.length,
                  itemBuilder: (context, index) => buildChatItem(index),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: Colors.black, height: 5);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomAppBar() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
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
              child: Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const Text(
          "Chats",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 33),
        ),
        const Spacer(),
        MyCircleIconButton(
          icon: Icons.camera_alt_rounded,
          onPressed: () {
            print('Camera');
          },
        ),
        const SizedBox(width: 5),
        MyCircleIconButton(
          icon: Icons.edit,
          onPressed: () {
            print('Edit');
          },
        ),
      ],
    );
  }

  Widget buildCustomSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }

  Widget buildStoriesRow() {
    return Container(
      height: 90,
      child: Row(
        children: [
          buildAddStoryItem(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 200,
              itemBuilder: (context, index) => buildStoryItem(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddStoryItem() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey,
        ),
        const CircleAvatar(
          radius: 33,
          backgroundColor: Colors.white,
        ),
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://resources.premierleague.com/photos/2022/07/02/d296ae9f-b850-4c6c-9ffe-88ae5658a93a/GettyImages-1396813126.jpg?width=500&height=333"),
            ),
            CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStoryItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: const [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blue,
          ),
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://resources.premierleague.com/photos/2022/07/02/d296ae9f-b850-4c6c-9ffe-88ae5658a93a/GettyImages-1396813126.jpg?width=500&height=333"),
          ),
        ],
      ),
    );
  }

  Widget buildChatItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(chatsData[index].imageUrl),
              ),
              const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 11,
                backgroundColor:
                    chatsData[index].online ? Colors.green : Colors.red,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatsData[index].username,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chatsData[index].message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      " . ${chatsData[index].dateTime}",
                      style: const TextStyle(
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
          Visibility(
            visible: chatsData[index].opened,
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 10,
            ),
          ),
          // CircleAvatar(
          //   backgroundColor:
          //       chatsData[index].opened ? Colors.white : Colors.blue,
          //   radius: 10,
          // ),
        ],
      ),
    );
  }
}

class ChatData {
  String imageUrl;
  String username;
  String message;
  String dateTime;
  bool online;
  bool opened;

  ChatData({
    required this.imageUrl,
    required this.username,
    required this.message,
    required this.dateTime,
    required this.online,
    required this.opened,
  });
}
