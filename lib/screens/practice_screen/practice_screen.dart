import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_equation/common_widget/keyboard.dart';

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
                ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Wrap(
                          children: [KeyBoard()],
                        ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
