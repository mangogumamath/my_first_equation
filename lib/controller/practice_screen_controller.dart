import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';

enum PracticeType {
  add(
    'add',
    '덧셈',
  ),
  omissionOfMultiplicationSign('omissionOfMultiplicationSign', '곱셈 기호의 생략'),
  undefined('undefined', '');

  final String code;
  final String displayName;
  const PracticeType(this.code, this.displayName);

  factory PracticeType.getByCode(String code) {
    return PracticeType.values.firstWhere((value) => value.code == code,
        orElse: () => PracticeType.undefined);
  }
}

class PracticeScreenController extends GetxController {
  static PracticeScreenController get to =>
      Get.find<PracticeScreenController>();

  @override
  void onInit() {
    super.onInit();
    generateValue();
  }

  var keyBoardValue = ''.obs;
  Expression keyBoardValueExpression = TeXParser('0').parse();
  PracticeType practiceType = PracticeType.omissionOfMultiplicationSign;
  var problemCount = 0.obs;
  var problemCount_max = 10.obs;

  var a = 0.obs;
  var b = 0.obs;
  var questionText = ''.obs;

  void generateValue() {
    problemCount.value += 1;
    keyBoardValue.value = '';

    if (practiceType == PracticeType.add) {
      a.value = Random().nextInt(9) + 1;
      b.value = Random().nextInt(9) + 1;
      questionText.value = '${a.value}+${b.value}';
    }

    if (practiceType == PracticeType.omissionOfMultiplicationSign) {
      List variableList = ['a', 'b', 'x'];
      String randomVariable1 = variableList[Random().nextInt(3)];
      String randomInt1 = (Random().nextInt(9) + 1).toString();
      String stringForTeX = '{$randomInt1}' + r'\times' + '{$randomVariable1}';
      questionText.value = stringForTeX;
    }
  }

  void answerCheck() {
    if (practiceType == PracticeType.add) {
      if (keyBoardValue.value == (a.value + b.value).toString()) {
        print('정답');
        generateValue();
        update();
      } else {
        print('오답');
      }
    }

    if (practiceType == PracticeType.omissionOfMultiplicationSign) {
      var temp = convertMathExpressionToTeXNode(keyBoardValueExpression);
      if (keyBoardValue.value == (a.value + b.value).toString()) {
        print('정답');
        print('');
        generateValue();
        update();
      } else {
        print('오답');
      }
    }
  }
}
