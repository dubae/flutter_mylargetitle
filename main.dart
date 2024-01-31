import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

/* stateful widget은 두 부분으로 구성됨
위젯: 적은 양의 코드  */
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

/* 우리가 ui를 구축하는 곳.
state라고 부름 */
class _MyWidgetState extends State<MyWidget> {
  int count = 0;
  List<int> number = [];

  void onclicked() {
    /** setstate(): state에게 값이 변경되었음을 알리는 함수. 
     * 이게 있어야 제대로 값이 반영됨.
     * build 메소드를 재실행하는 것,
     * 안에 넣지 않아도 되지만 넣는 것을 추천(가독성)
     */
    setState(() {
      number.add(number.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Count',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              /* for문 사용법 */
              for (var n in number)
                Text(
                  '$n',
                  style: const TextStyle(fontSize: 30),
                ),
              IconButton(
                onPressed: onclicked,
                icon: const Icon(
                  Icons.add_box_sharp,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
