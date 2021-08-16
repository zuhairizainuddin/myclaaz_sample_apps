import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String height = '0';
  String weight = '0';
  String results = 'No results yet!';
  String category = '';
  Color resultColor = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
            'https://images.unsplash.com/photo-1470167290877-7d5d3446de4c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Body Mass Index'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Please enter the required values',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (String text) {
                        height = text;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter height (cm)',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (String text) {
                        weight = text;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter weight (kg)',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    final resultsInDouble =
                        calculateBmi(height: height, weight: weight);

                    category = idealOrNot(bmi: resultsInDouble);

                    resultColor = getColors(bmi: resultsInDouble);

                    results = resultsInDouble.toStringAsFixed(2);
                  });
                },
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: double.infinity,
                color: resultColor,
                child: Center(
                  child: Text(
                    '$results\n\n$category',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double calculateBmi({required String height, required String weight}) {
  // Convert String to double first
  double heightInCm = double.parse(height);
  double weightInKg = double.parse(weight);

  // Convert height from cm to meter
  double heightInMeter = heightInCm / 100;

  // Calculate the BMI (height in meters, weight in kg)
  final bmi = weightInKg / (heightInMeter * heightInMeter);

  // Return the result
  return bmi;
}

String idealOrNot({required double bmi}) {
  if (bmi < 18 || bmi > 23) {
    return 'Your BMI is not ideal!';
  } else {
    return 'Your BMI is normal!';
  }
}

Color getColors({required double bmi}) {
  if (bmi < 18 || bmi > 23) {
    return Colors.red.withOpacity(0.8);
  } else {
    return Colors.green.withOpacity(0.8);
  }
}
