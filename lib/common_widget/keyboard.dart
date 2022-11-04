import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_equation/controller/practice_screen_controller.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard({Key? key}) : super(key: key);

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Obx(() => Text(
                              PracticeScreenController.to.keyBoardValue.value ==
                                      ''
                                  ? '답을 입력해주세요'
                                  : PracticeScreenController
                                      .to.keyBoardValue.value,
                              style: TextStyle(fontSize: size.height * 0.04),
                            )),
                      ),
                      IconButton(
                        onPressed: () {
                          PracticeScreenController.to.keyBoardValue.value = '';
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: size.height * 0.05,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_right),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('잘 모르겠어요'),
        ),
        Column(
          children: [
            Row(
              //첫줄
              children: [
                KeyBoardButton(
                  addString: '1',
                  mediaQuerySize: size,
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '2',
                  mediaQuerySize: size,
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '3',
                  mediaQuerySize: size,
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
              ],
            ),
            Row(
              //둘째줄
              children: [
                KeyBoardButton(
                  addString: '4',
                  mediaQuerySize: size,
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '5',
                  mediaQuerySize: size,
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '6',
                  mediaQuerySize: size,
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
              ],
            ),
            Row(
              //셋째줄
              children: [
                KeyBoardButton(
                  addString: '7',
                  mediaQuerySize: size,
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '8',
                  mediaQuerySize: size,
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '9',
                  mediaQuerySize: size,
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
              ],
            ),
            Row(
              //넷째줄
              children: [
                KeyBoardButton(
                  addString: '-',
                  mediaQuerySize: size,
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  addString: '0',
                  mediaQuerySize: size,
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
                KeyBoardButton(
                  function: () {
                    if (PracticeScreenController
                        .to.keyBoardValue.value.isNotEmpty) {
                      PracticeScreenController.to.keyBoardValue.value =
                          PracticeScreenController.to.keyBoardValue.value
                              .substring(
                                  0,
                                  PracticeScreenController
                                          .to.keyBoardValue.value.length -
                                      1);
                    }
                  },
                  mediaQuerySize: size,
                  child: Icon(Icons.arrow_back, size: size.height * 0.05),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class KeyBoardButton extends StatelessWidget {
  KeyBoardButton({
    super.key,
    required this.mediaQuerySize,
    required this.child,
    String? addString,
    Function? function,
  }) {
    this.addString = addString ?? '';
    this.function = function ?? () {};
  }

  Size mediaQuerySize;
  Widget child;
  String addString = '';
  Function function = () {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          PracticeScreenController.to.keyBoardValue.value += addString;
          function();
        },
        child: Container(
          height: mediaQuerySize.height * 0.09 < 50.0
              ? 50.0
              : mediaQuerySize.height * 0.09,
          child: Center(child: child),
        ),
      ),
    );
  }
}
