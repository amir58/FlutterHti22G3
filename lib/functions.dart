void main() {
  print(sum(10, 45));
  print(sum(5, 65));
  print(sum(43, 22));

  List<int> numbers = [
    21,
    43,
    53,
    24,
    29,
    12,
  ];
  print("Average : ${average(numbers)}");

  print(easySum(20, 45));

  printName(
    firstName: 'Amir',
    lastName: "Mohammed",
  );
}

// returnType => DataType , void
// returnType funName ( parameters ) { funBody }

void printName({required String firstName, String lastName = ""}) {
  print('Hello $firstName $lastName!');
}

void test(int numberOne, [int numberTwo = 0]) {} // Normal parameters

void test2({required int numberOne, int numberTwo = 0}) {} // Named parameters

int sum(int numberOne, int numberTwo) {
  return numberOne + numberTwo;
}

int easySum(int numberOne, int numberTwo) => numberOne + numberTwo;

int average(List<int> numbers) {
  int average = 0;
  for (var value in numbers) {
    // average =  average + value;
    average += value;
  }
  return (average / numbers.length).round();
}
