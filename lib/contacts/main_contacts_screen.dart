import 'package:flutter/material.dart';
import 'package:hti22three/contacts/contacts_screen.dart';
import 'package:hti22three/contacts/favorites_screen.dart';
import 'package:sqflite/sqflite.dart';

Database? database;

class MainContactsScreen extends StatefulWidget {
  const MainContactsScreen({Key? key}) : super(key: key);

  @override
  State<MainContactsScreen> createState() => _MainContactsScreenState();
}

class _MainContactsScreenState extends State<MainContactsScreen> {
  // Database
  // CRUD => Create, Read, Update, Delete

  @override
  void initState() {
    super.initState();

    createDatabase();
  }


  Future<void> createDatabase() async {
    // open the database
    database = await openDatabase("contacts", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Contacts (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, favorite INTEGER)');
      print('Create');
    }, onOpen: (database) {
      print('OPENED');
    });

  }

  void insertContact({required String name, required String phone}) async {
    // Insert some records in a transaction
    await database?.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Contacts(name, phone, favorite) VALUES("$name", "$phone", 0)');

      print('inserted1: $id1');
    });
  }

  void getContacts() async {
    List<Map>? list = await database?.rawQuery('SELECT * FROM Contacts');

    print("List => $list");
    setState((){});
  }

  void updateContact({
    required int favorite,
    required int id,
  }) {
    database?.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', ['$favorite', '$id']);
  }

  void deleteContact({required int id}) async {
    int? count =
        await database?.rawDelete('DELETE FROM Contacts WHERE id = ?', ['$id']);
    assert(count == 1);
  }

  // Database
  List<String> titles = ["Contacts", "Favorites"];

  List<Widget> screens = [ContactsScreen(), FavoritesScreen()];

  int index = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print(value);
          index = value;
          setState(() {});
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "Favorites",
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: index == 0,
        child: FloatingActionButton(
          onPressed: () {
            if (isBottomSheetExpand) {
              if (formKey.currentState!.validate()) {
                String name = nameController.text;
                String phone = phoneController.text;

                insertContact(name: name, phone: phone);

                nameController.clear();
                phoneController.clear();

                Navigator.pop(context);
                isBottomSheetExpand = false;
              }
            } else {
              showScaffoldBottomSheet();
              isBottomSheetExpand = true;
            }
            setState(() {});
          },
          child: Icon(isBottomSheetExpand ? Icons.done : Icons.add),
        ),
      ),
      body: screens[index],
    );
  }

  void showDefaultBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void showScaffoldBottomSheet() {
    scaffoldKey.currentState!
        .showBottomSheet((context) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact name required";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Contact name",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact phone required";
                      }
                      if (value.length < 11) {
                        return "Contact phone must be 11 digits";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Contact phone",
                    ),
                  ),
                ],
              ),
            ),
          );
        })
        .closed
        .then((value) {
          print('Bottom sheet closed');
          isBottomSheetExpand = false;
          setState(() {});
        });
  }
}
