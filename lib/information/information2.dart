import 'package:flutter/material.dart';

void main() {
  runApp(Information());
}

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      home: Information2(),
    );
  }
}

class Information2 extends StatefulWidget {
  const Information2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Information2();
  }
}

class _Information2 extends State<Information2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFE072),
        title: Text(
          '자취 지원 정보',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(4)),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFFF0A4),
                border: Border(
                  top: BorderSide(),
                  bottom: BorderSide(),
                ),
              ),
              height: 170,
              child : Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 25),
                  ),
                  Text(
                    "대전 청년 월세 지원 사업 안내",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10,),
                  ),
                  Container(
                    width: 350,
                    height: 70,
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Text("2023년 01월 15일",
                      style: TextStyle(fontSize: 15),
                      ),
                        SizedBox(height: 10,
                        ),
                        Text(" daegeon.djbea.or.kr",
                          style: TextStyle(fontSize: 18, color: Color(0xff1D2C52)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Text(
                "신청기간 | 2023년 2월 27일(월)~ 3월 10일 (금)\n"
                    "선정발표 | 2023년 4월 26일 (수) 예정\n"
                    "지원 대상 | 신청일 기준 대전시 거주,\n"
                    "만 19~39세 무주택 1인 가구 및 청년 부부\n"
                    "소득 기준 | 기준 중위소득 150% 이하\n"
                    "지원 내용 | 월 20만원, 최대 12개월 지원",
                style: TextStyle(fontSize: 17,height: 2.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

