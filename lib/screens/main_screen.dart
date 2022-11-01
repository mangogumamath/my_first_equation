import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_equation/screens/calculationtype_select_main_screen/calculationtype_select_main_screen.dart';
import 'package:my_first_equation/screens/myinfo_screen/myinfo_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = 0.obs;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('abc')),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            onDestinationSelected: (int index) {
              currentPageIndex.value = index;
            },
            selectedIndex: currentPageIndex.value,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.calculate),
                label: '계산',
              ),
              // NavigationDestination(
              //   icon: Icon(Icons.military_tech),
              //   label: '순위',
              // ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: '내 정보',
              ),
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: currentPageIndex.value,
            children: [
              CalculationTypeSelectMainScreen(),
              MyInfoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
