import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculatorBrain.dart';
import 'result.dart';
import 'dart:math';


void main() => runApp(BmiCalc());

class BmiCalc extends StatelessWidget {
  const BmiCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFF1D1E33)),
      home: Input(),
    );
  }
}

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String selectGender = '';
  int height =
      180; //this property will change all the time the user slides on slider
  int weight = 60;
  int age = 5;
  String calcBmi() {
    double bmi = weight / pow(height / 100, 2);
   return  bmi.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade400,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 170,
                  height: 200,
                  //here if i add  color then app crashes thats why add color to decoration
                  decoration: BoxDecoration(
                    color: selectGender == 'male'
                        ? Colors.purple.shade100 // Darker shade when selected
                        : Colors
                            .purple.shade50, // Normal shade when not selected
                    //color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = 'male';
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1D1E33),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                    color: selectGender == 'female'
                        ? Colors.purple.shade100 // Darker shade when selected
                        : Colors
                            .purple.shade50, // Normal shade when not selected
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = 'female'; // Changed 'male' to 'female'
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1D1E33),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 380,
                  height: 200,
                  //here if i add  color then app crashes thats why add color to decoration
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1D1E33),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height
                                .toString(), //here  180 is change to height.tostring bcz height is gpoing to change on slider and  even we cant simply add height bcz text property cant be number
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("cm"),
                        ],
                      ),
                      Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFF1D1E33),
                          inactiveColor: Colors.purple.shade300,
                          onChanged: (double newval) {
                            setState(() {
                              height = newval.round();
                            });
                          })
                    ],
                  ),
                  padding: EdgeInsets.only(top: 20),
                ),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 170,
                  height: 200,
                  //here if i add  color then app crashes thats why add color to decoration
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1D1E33),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(weight.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple
                                    .shade300, // Change this to your desired color
                              ),
                              child:
                                  Icon(Icons.add, color: Colors.purple.shade50),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple
                                    .shade300, // Change this to your desired color
                              ),
                              child: Icon(Icons.remove,
                                  color: Colors.purple.shade50),
                            ),
                          ],
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 170,
                  height: 200,
                  //here if i add  color then app crashes thats why add color to decoration
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1D1E33),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(age.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple
                                    .shade300, // Change this to your desired color
                              ),
                              child:
                                  Icon(Icons.add, color: Colors.purple.shade50),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple
                                    .shade300, // Change this to your desired color
                              ),
                              child: Icon(Icons.remove,
                                  color: Colors.purple.shade50),
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmiresult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.purple.shade50,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.purple.shade400,
                height: 50,
              ),
            )
          ],
        ));
  }
}
/* dart ternary operator:
if(condition is true)
{do this}
else
{do this}
////////////////in dart

condition ? dothisIftrue: dothisdIffalse

1. jackisgood== true? print(thats great): print(oh no);
   output: thats great

2. int age=12;
   bool ans= age>21?  true:false;
   output:false

 */
