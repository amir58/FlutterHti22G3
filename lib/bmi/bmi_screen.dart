import 'package:flutter/material.dart';
import 'package:hti22three/bmi/bmi_result_screen.dart';
import 'package:hti22three/style/colors.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool male = true;
  double height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildMaleFemaleItems(),
          buildHeightItem(),
          buildWeightAndAgeItems(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  Widget buildMaleFemaleItems() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                male = true;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: male ? selectedColor : secondColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.male,
                      size: 66,
                      color: Colors.white,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                male = false;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: male ? secondColor : selectedColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.female_rounded,
                      size: 66,
                      color: Colors.white,
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeightItem() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Height',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
            Text(
              '${height.toInt()}cm',
              style: const TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 50,
              max: 220,
              value: height,
              activeColor: pinkColor,
              inactiveColor: Colors.grey,
              onChanged: (double value) {
                print(value);
                height = value;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildWeightAndAgeItems() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    weight.toString(),
                    style: const TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            weight--;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            weight++;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "$age",
                    style: const TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            if (age == 1) return;
                            age--;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            age++;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCalculateButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BmiResultScreen(),),
        );
      },
      child: Container(
        color: pinkColor,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        alignment: AlignmentDirectional.center,
        child: const Text(
          "CALCULATE",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
    );
  }
}
