import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  final List<MyContact> myContacts =[
    MyContact("Amir Mohammed", "01116036522"),
    MyContact("Mohammed Ahmed ", "0128436932"),
    MyContact("Ali Mohammed", "01030936083"),
    MyContact("Ali Ali", "0153872338"),
    MyContact("Ali Ali", "0153872338"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView.builder(
        itemCount: myContacts.length,
        itemBuilder: (context, index) {
          print('ListView index => $index');
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  myContacts[index].name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  myContacts[index].phone,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
