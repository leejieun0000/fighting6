import 'package:flutter/material.dart';

/*void main() {
  runApp(const MyWidget());
}*/

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyWidget();
  }
}

class _MyWidget extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                print("navigate");
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
                        Padding(padding: EdgeInsets.only(top: 25),),
                        Text(
                          "대전 청년 월세 지원 사업 안내",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10),),
                        Text("2023년 01월 15일",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.right,//왜 안돼..
                        ),
                        Padding(padding: EdgeInsets.only(top: 10),),
                        Text(" daegeon.djbea.or.kr",
                          style: TextStyle(fontSize: 18, color: const Color(0xff1D2C52)),
                          textAlign: TextAlign.right, // 왜 안돼
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    child: Text(
                      "~~~~~~~~~~~~~~~~~~~~~~~~",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "notice"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "person"),
            ],
          ),
        ),
        );
  }
}
