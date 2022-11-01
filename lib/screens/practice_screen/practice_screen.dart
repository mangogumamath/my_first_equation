import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:get/get.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({Key? key}) : super(key: key);

  Color cardColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    cardColor = Theme.of(context).colorScheme.primaryContainer;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            '연습 화면',
          ),
          actions: [],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('문제수', style: TextStyle(fontSize: 30.0)),
                        Text('3/10', style: TextStyle(fontSize: 30.0)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('점수', style: TextStyle(fontSize: 30.0)),
                        Text('3520', style: TextStyle(fontSize: 30.0)),
                      ],
                    ),
                  ],
                ),
                Card(
                  child: Text('문제', style: TextStyle(fontSize: 30.0)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MathField(
                autofocus: false,
                variables: const ['x', 'a', 'b', 'c'],
                onChanged: (value) {
                  String expression;
                  try {
                    expression = '${TeXParser(value).parse()}';
                  } catch (_) {
                    expression = 'invalid input';
                  }

                  print('input expression: $value\n'
                      'converted expression: $expression');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
