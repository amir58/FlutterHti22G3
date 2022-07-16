import 'dart:io';

void main() {
  // ClassName objName = ClassName();

  /*User userOne = User("Amir","20","011","Cairo");
  userOne.printUserData(); // optional now because you called it in constructor

  User userTwo = User("Ali","20","012", "Alex");
  */

  User userThree = User.easy("Ahmed", "010");
  userThree.printUserData();

  // names();
}

void names() {
  print('Enter users count : ');

  String strNamesCount = stdin.readLineSync() ?? "";

  int namesCount = int.parse(strNamesCount);

  List<User> users = [];

  int counter = 0;
  while (counter < namesCount) {
    print('Enter name ${counter + 1} : ');
    String name = stdin.readLineSync() ?? "";

    print('Enter age ${counter + 1} : ');
    String age = stdin.readLineSync() ?? "";

    print('Enter phone ${counter + 1} : ');
    String phone = stdin.readLineSync() ?? "";

    print('Enter address ${counter + 1} : ');
    String address = stdin.readLineSync() ?? "";

    User user = User(name, age, phone, address);

    users.add(user);

    counter++;
    print('- - - - - - - - - - ');
  }

  for (var element in users) {
    element.printUserData();
  }
  print('- - - - - - - - - - ');
}

class User {
  String name = "";
  String age = "";
  String _phone = "";
  String address = "";

  User(this.name, this.age, this._phone, this.address) {
    // printUserData();
  }

  User.easy(this.name, this._phone);

  String get phone => "+2$_phone";

  String getPhone() => "+2$_phone";

  set phone(String phone) {
    if (phone.length == 11) {
      _phone = phone;
    } else {
      print('Invalid phone number');
    }
  }

  // void setPhone(String phone) {
  //   if (phone.length == 11) {
  //     _phone = phone;
  //   }
  //   else{
  //     print('Invalid phone number');
  //   }
  // }

  void printUserData() {
    print('- - - - - - - - - - ');
    print('Name : $name');
    print('Age : $age');
    print('Phone : $_phone');
    print('Address : $address');
  }
}
