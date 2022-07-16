import 'dart:io';

void main() {
  nullSafety();
}

void naming() {
  print('HelloFlutter!');

  // Amir != amir ( Case Sensitivity )
  // DataTypes => String , int , double , bool
  // DataType varName = value ;
  // var varName = value ;

  String myName = 'Ahmed';
  var studentName = "Ali";

  print("Your name : " + myName);
  print("Your name : $myName!");
  print(studentName);

  // camelCase
  String firstName = "Cat";
  String lastName = "";
  String welcomeInFlutterCourseMessage = "";

  // String test = stdin.readLineSync() ?? "";
  // String? test2 = stdin.readLineSync();

  print('Enter your name : ');
  String name = stdin.readLineSync() ?? "";

  // if ( condition ) { code } else { code }

  if (name.isEmpty) {
    print('Welcome user');
  } else {
    print('Welcome $name');
  }
}

void conditions() {
  print('Enter your order status : ');
  String orderStatus = stdin.readLineSync() ?? "";

  if (orderStatus == "inStore") {
    print('1');
  } else if (orderStatus == "onWay") {
    print('2');
  } else if (orderStatus == "finished") {
    print('3');
  } else {
    print('Order status unknown!');
  }

  switch (orderStatus) {
    case "inStore":
      print('1');
      break;

    case "onWay":
      print('2');
      break;

    case "finished":
      print('3');
      break;

    default:
      print('Order status unknown');
      break;
  }
}

void lists() {
  // List<DataType> listName = [];
  // var listName = [];

  List<String> names = ["Amir", "Ahmed", "Ali"];
  print(names[0]);
  print(names[1]);
  print(names[2]);
  // print(names[5]); Error

  names[0] = "Mahmoud";

  for (var value in names) {
    print('Name => $value');
  }

  names.add("Mohammed");

  List<String> studentsNames = ["Youssef", "Moaz"];
  names.addAll(studentsNames);
  print(names);

  print(names.length);
  print(names.isEmpty);
  print(names.isNotEmpty);
  print(names.first);
  print(names.last);

  // names.clear();
  print(names.reversed);

  print(names.contains("Ahmed"));
  print(names.removeLast());
  print(names.removeAt(3));
  print(names.remove("Ali"));
  print(names.elementAt(1));
}

void loops() {
  // for , while , do while
  int x = 0;

  while (x < 5) {
    print(x);
    x++; // increment
  }

  for (int x = 0; x <= 5; x++) {
    print("For => $x");
  }

  int i = 0;
  do {
    print('Do => $i');
    i++;
  } while (i > 5);
}

void names() {
  print('Enter names count : ');

  String strNamesCount = stdin.readLineSync() ?? "";

  int namesCount = int.parse(strNamesCount);

  List<String> names = [];

  int counter = 0;
  while (counter < namesCount) {
    print('Enter name ${counter + 1} : ');
    String name = stdin.readLineSync() ?? "";
    names.add(name);
    counter++;
  }
  print(names);
  print('- - - - - - - - - - ');
}

void strings() {
  String dateTime = "02/07/2022  07:49PM";
  List<String> dateTimes = dateTime.split("  ");
  print(dateTimes);
  print(dateTimes[0]);
  print(dateTimes[1]);

  print('- - - - - - - - - -');
  String text = "Welcome in flutter course";
  print(text.length);
  print(text.isEmpty);
  print(text.isNotEmpty);
  print(text.contains("in"));
  print(text.toUpperCase());
  print(text.toLowerCase());
  print(text.substring(8, 10));
  print('- - - - - - - - - -');

  String email = " amir@gmail.com  ";
  print(email.length);
  print(email.trim().length);
  print(email.trimLeft().length);
  print(email.trimRight().length);
  print(email.trim());

  print('- - - - - - - - - -');

  // 00201116036522 , +201116036522 , 0020111 6036 522
  // 0020111-6036-522 , +20111-6036-522 , +20111 6036 522
  // 01116036522 , 0111 6036 522 , 0111-6036-522

  String phoneNumber = "+20111 6036-002";
  print(phoneNumber);

  phoneNumber = phoneNumber.replaceAll(" ", "")
      .replaceAll("-", "")
      .replaceAll("+2", "");

  if(phoneNumber.startsWith("002")){
    phoneNumber = phoneNumber.replaceFirst("002", "");
  }

  print(phoneNumber);
  print(phoneNumber.length);
}

void nullSafety(){
  // ? , ! , ?? , ??=
  print('Enter name : ');
  String? name = stdin.readLineSync();

  print(name!.isEmpty);

  String nameTwo = stdin.readLineSync() ?? "";

  print(nameTwo.isEmpty);

  String? nameThree = null;

  nameThree = "Amir";
  nameThree ??= "Ali";

  print(nameThree);
  print(nameThree.isEmpty);
}
