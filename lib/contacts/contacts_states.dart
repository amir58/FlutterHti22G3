class ContactsStates{}

class InitContactState extends ContactsStates{}

class GetContactsState extends ContactsStates{
  final List<Map> contacts;

  GetContactsState(this.contacts);
}

class GetFavoritesState extends ContactsStates{}

