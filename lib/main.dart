import 'package:flutter/material.dart';

class MarksCalculator extends StatefulWidget {
  @override
  _MarksCalculatorState createState() => _MarksCalculatorState();
}

class _MarksCalculatorState extends State<MarksCalculator> {
  TextEditingController _subject1Controller = TextEditingController();
  TextEditingController _subject2Controller = TextEditingController();
  TextEditingController _subject3Controller = TextEditingController();

  double _totalMarks = 0.0;
  double _percentage = 0.0;

  void _calculateMarksAndPercentage() {
    double subject1Marks = double.parse(_subject1Controller.text);
    double subject2Marks = double.parse(_subject2Controller.text);
    double subject3Marks = double.parse(_subject3Controller.text);

    setState(() {
      _totalMarks = subject1Marks + subject2Marks + subject3Marks;
      _percentage = (_totalMarks / 300) * 100; // Assuming total marks for each subject is 100
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('DMC Generator'),
          backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _subject1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Subject 1 Marks'),
            ),
            TextField(
              controller: _subject2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Subject 2 Marks'),
            ),
            TextField(
              controller: _subject3Controller,
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(labelText: 'Subject 3 Marks'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _calculateMarksAndPercentage();
              },
              child:const  Text('Calculate'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber), // Set button color to teal
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Marks Obtained: $_totalMarks',
              style:const  TextStyle(fontSize: 16.0),
            ),
            Text(
              'Percentage: ${_percentage.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MarksCalculator(),
  ));
}
