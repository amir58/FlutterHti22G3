import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22three/contacts/contacts_states.dart';
import 'package:sqflite/sqflite.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(InitContactState());

  late Database database;

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
      int id1 = await txn.rawInsert(
          'INSERT INTO Contacts(name, phone, favorite) VALUES("$name", "$phone", 0)');

      print('inserted1: $id1');
    });

    getContacts();
  }

  void getContacts() async {
    contacts = await database.rawQuery('SELECT * FROM Contacts');

    print("List => $contacts");
    // setState((){});
    emit(GetContactsState());
  }

  void getFavorites() async{
    favorites = await database.query("Contacts",
        columns: ["id", "name", "phone", "favorite"],
        where: 'favorite = ?',
        whereArgs: [1]);

    print(favorites);
    emit(GetFavoritesState());
  }

  void updateContact({
    required int favorite,
    required int id,
  }) {
    database?.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', ['$favorite', '$id']);

    getContacts();
    getFavorites();
  }

  void deleteContact({required int id}) async {
    int? count =
        await database?.rawDelete('DELETE FROM Contacts WHERE id = ?', ['$id']);
    assert(count == 1);

    getContacts();
    getFavorites();
  }
}
