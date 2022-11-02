import 'package:flutter/material.dart';

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
                  child: Text('답을 입력해 주세요'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black12,
                    ),
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
                  child: Text('1'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('2'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('3'),
                  mediaQuerySize: size,
                ),
              ],
            ),
            Row(
              //둘째줄
              children: [
                KeyBoardButton(
                  child: Text('4'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('5'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('6'),
                  mediaQuerySize: size,
                ),
              ],
            ),
            Row(
              //셋째줄
              children: [
                KeyBoardButton(
                  child: Text('7'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('8'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('9'),
                  mediaQuerySize: size,
                ),
              ],
            ),
            Row(
              //넷째줄
              children: [
                KeyBoardButton(
                  child: Text('-'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Text('0'),
                  mediaQuerySize: size,
                ),
                KeyBoardButton(
                  child: Icon(Icons.arrow_back),
                  mediaQuerySize: size,
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
    Key? key,
    required this.mediaQuerySize,
    required this.child,
  }) : super(key: key);

  Size mediaQuerySize;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
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
