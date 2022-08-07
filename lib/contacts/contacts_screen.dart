import 'dart:async';

import 'package:flutter/material.dart';

import 'main_contacts_screen.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Map>? list = [];

  void getContacts() async {
    list = await database?.rawQuery('SELECT * FROM Contacts');

    print("List => $list");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (database == null) {
      // Timer.periodic(Duration(seconds: 1), (timer) { });

      Future.delayed(
        const Duration(seconds: 1),
        () {
          getContacts();
        },
      );
    }
  }

  // final List<MyContact> myContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list?.length,
        itemBuilder: (context, index) {
          print('ListView index => $index');
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list![index]['name'],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        list![index]['phone'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border))
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyContact {
  String name;
  String phone;

  MyContact(this.name, this.phone);
}
