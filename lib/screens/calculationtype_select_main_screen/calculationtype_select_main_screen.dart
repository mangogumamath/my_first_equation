import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:get/get.dart';
import 'package:my_first_equation/screens/practice_screen/practice_screen.dart';

class CalculationTypeSelectMainScreen extends StatelessWidget {
  CalculationTypeSelectMainScreen({Key? key}) : super(key: key);

  Color cardColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    cardColor = Theme.of(context).colorScheme.primaryContainer;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          '계산 유형 선택',
        ),
        actions: [],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => PracticeScreen());
                },
                child: Text('Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
