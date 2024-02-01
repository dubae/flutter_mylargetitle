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
  /// buildContext: 위젯 트리에서 위젯의 위치에 대한 정보를 제공.
  /// 이를 이용해서 상위 위젯에 대한 정보를 하위 위젯으로 넘길 수 있음
  /// theme을 text로 넘겨서 색상 정보를 제공할 수 있음.
  bool show = true;

  void toggle() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /**theme: 한 곳에서 글자 색, 배경 색 등 디자인 요소를 지정하기 */
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              show ? const MyLargeTitle() : const Text('nothing'),
              IconButton(onPressed: toggle, icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  ///initState() : 부모 요소로부터 변수를 초기화하고 싶을 때,
  ///APi로부터 데이터를 가져와 초기화하고 싶을 때 사용.
  ///평상시에는 크게 사용할 필요는 없음
  /// build 메소드보다 먼저 호출되며, 딱 한번 호출됨.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState!");
  }

  ///dispose(): 위젯이 화면에서 사라질 때 작동.
  ///무언가를 취소하는 곳.
  ///api업데이트, 이벤트 리스너 구독 취소 등.
  ///위젯이 위젯 트리에서 제거될 때.
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Text(
      'My large title',
      style: TextStyle(
        /// 아래 문법: context로부터 부모 위젯의 정보를 가져오는 방법 익히기.
        /// Theme.of(context) 를 이용해 부모 Theme 가져옴.
        color: Theme.of(context).textTheme.titleLarge?.color,

        fontSize: 40,
      ),
    );
  }
}
