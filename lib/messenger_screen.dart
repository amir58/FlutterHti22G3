import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

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
                child: ListView.builder(
                  itemCount: 500,
                  itemBuilder: (context, index) => buildChatItem(),
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
        buildAppBarIcons(Icons.camera_alt_rounded),
        const SizedBox(width: 5),
        buildAppBarIcons(Icons.edit),
      ],
    );
  }

  Widget buildAppBarIcons(IconData icon) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
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
