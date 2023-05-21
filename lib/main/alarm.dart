import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  _Alarm createState() => _Alarm();
}

class _Alarm extends State<Alarm> {
  final List<Map<String, String>> _valueList_2 = [
    {
      'alarm_detail': '\'드라이버 빌려드립니다.\' 게시글에 댓글이 달렸습니다.',
    },
    {
      'alarm_detail': '\'트레이더스 공구 하실 분 구합니다.\' 게시글에 댓글이 달렸습니다.',
    },
    {
      'alarm_detail': '\'드라이버 빌려드립니다.\' 반납일이 3일 남았습니다.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '알림',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.navigate_before),
          ),
          onPressed: () {
            Navigator.pop(
                context
            );
          },
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            height: 10 * 3,
            thickness: 1.5,
            color: Colors.grey,
            indent: 10,
          );
        },
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {// 현재 인덱스에 해당하는 항목을 가져옵니다.
          final item = _valueList_2[index];
          return SizedBox(
            height: 80,
            child: Row(
              children: [
                Image(
                  image:AssetImage("images/bell.png"),
                  width: 35,
                  height: 35,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          item['alarm_detail']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: _valueList_2.length, // 항목 수를 동적으로 설정합니다.
      ),
    );
  }
}
