import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22three/contacts/contacts_states.dart';
import 'package:sqflite/sqflite.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(InitContactState());

  late Database database;
  var firestore = FirebaseFirestore.instance;

  List<Map> contacts = [];
  List<Map> favorites = [];

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

    getContacts();
    getFavorites();
  }

  void insertContact({required String name, required String phone}) async {
    // Insert some records in a transaction
    await database?.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Contacts(name, phone, favorite) VALUES("$name", "$phone", 0)');

      firestore.collection("htiSatContacts").doc(id.toString()).set({
        "id": id,
        "name": name,
        "phone": phone,
        "favorite": 0,
      });
    });

    getContacts();
  }

  void getContacts() async {
    // contacts = await database.rawQuery('SELECT * FROM Contacts');

    print("List => $contacts");

    await firestore.collection("htiSatContacts").get().then((value) {
      contacts.clear();

      for (var document in value.docs) {
        print(document.data());
        contacts.add(document.data());
      }

    });

    // setState((){});
    emit(GetContactsState(contacts));
  }

  void getFavorites() async {
    // favorites = await database.query("Contacts",
    //     columns: ["id", "name", "phone", "favorite"],
    //     where: 'favorite = ?',
    //     whereArgs: [1]);

    await firestore.collection("htiSatContacts")
        .where("favorite", isEqualTo: 1)
        .get()
        .then((value) {
      favorites.clear();

      for (var document in value.docs) {
        favorites.add(document.data());
      }

    });

    print(favorites);
    emit(GetFavoritesState());
  }

  void updateContact({
    required int favorite,
    required int id,
  }) {
    database?.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', ['$favorite', '$id']);

    firestore.collection("htiSatContacts").doc(id.toString()).update({
      "favorite": favorite,
    });

    getContacts();
    getFavorites();
  }

  void deleteContact({required int id}) async {
    int? count =
        await database?.rawDelete('DELETE FROM Contacts WHERE id = ?', ['$id']);
    assert(count == 1);

    firestore.collection("htiSatContacts").doc(id.toString()).delete();

    getContacts();
    getFavorites();
  }
}
