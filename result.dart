import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final String bmiresult;
  final String resultText;
  final String interpretation;

  const Result({
    Key? key,
    required this.bmiresult,
    required this.resultText,
    required this.interpretation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Results",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 500,
            height: 600,
            color: Colors.purple.shade50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultText,  // Use the passed resultText
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Text(
                  bmiresult,  // Use the passed bmiresult
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  interpretation,  // Use the passed interpretation
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                "RECALCULATE",
                style: TextStyle(
                    color: Colors.purple.shade50,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              color: Colors.purple.shade400,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}