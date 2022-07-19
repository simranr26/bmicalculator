import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/constants/app_constants.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.yellowAccent, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellowAccent,
                    ),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellowAccent,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = 'You are overweight';
                  } else if (_bmiResult >= 18 && _bmiResult <= 25) {
                    _textResult = 'You have weight';
                  } else {
                    _textResult = 'You are under weight';
                  }
                });
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: Colors.yellowAccent),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellowAccent),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
