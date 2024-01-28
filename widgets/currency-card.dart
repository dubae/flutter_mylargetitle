import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool inverted;
  final double offsetVal;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.inverted,
    required this.offsetVal,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offsetVal),
      child: Container(
          clipBehavior: Clip.hardEdge, //overflow가 일어난 경우 어떻게 할지 결정하는 속성
          decoration: BoxDecoration(
            color: inverted ? Colors.white : const Color(0xFF1F2123),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: inverted ? const Color(0xFF1F2123) : Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          amount,
                          style: TextStyle(
                            color: inverted ? const Color(0xFF1F2123) : Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          code,
                          style: TextStyle(
                            color: inverted ? const Color(0xFF1F2123) : Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  //아이콘을 커지게끔 하는 위젯.
                  scale: 2,

                  child: Transform.translate(
                    //아이콘을 움직이는데 사용하는 위젯.
                    offset: const Offset(2, 13),
                    child: Icon(
                      //아이콘 넣는 법.
                      icon,
                      color: inverted ? const Color(0xFF1F2123) : Colors.white,
                      size: 78,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
