import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:get/get.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:my_first_equation/common_widget/keyboard.dart';
import 'package:my_first_equation/controller/practice_screen_controller.dart';

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
                        Obx(
                          () => Text(
                              '${PracticeScreenController.to.problemCount.value}/${PracticeScreenController.to.problemCount_max.value}',
                              style: TextStyle(fontSize: 30.0)),
                        )
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
                  child: SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Center(
                        child: GetBuilder<PracticeScreenController>(
                            builder: (_) => Math.tex(
                                  PracticeScreenController
                                      .to.questionText.value,
                                  textStyle: TextStyle(fontSize: 30.0),
                                ))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Wrap(
                          children: [KeyBoard()],
                        ),
                        barrierColor: Colors.black12.withOpacity(0),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                      );
                    },
                    child: Text('버튼', style: TextStyle(fontSize: 30.0))),
                MathField(
                  variables: const ['a', 'b', 'x'],
                  onChanged: (value) {
                    try {
                      //필요한 값
                      // 1.문제TeX용 String '{7}'+r'\times'+'{a}'
                      // 2.1을 변환한 Expression
                      // 3.키보드로 입력받은 TeX용 String
                      // 4.3을 변환한 Expression

                      //value는 Tex용 String
                      // PracticeScreenController.to.questionText.value = value;
// PracticeScreenController.to.keyBoardValueExpression = value;
                      //'${TeXParser(value).parse()}'는 mathExpression용 String
                      PracticeScreenController.to.keyBoardValue.value =
                          '${TeXParser(value).parse()}';
                      print(value);
                      print(TeXParser(value).parse());
                      print(convertMathExpressionToTeXNode(
                              TeXParser(value).parse())
                          .buildTeXString());
                      PracticeScreenController.to.update();
                    } catch (_) {}
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
