import 'package:flutter/material.dart';


void main() {
  runApp(const MyWidget());
}


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
            // backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                print("navigate");
              },
            ),
            actions: [
              Container(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    cardColor: Color(0xffFFE072),
                  ),
                  child: PopupMenuButton<Text>(
                      icon: Icon(Icons.menu),
                      shape: RoundedRectangleBorder(
                        /*side: const BorderSide(width: 1, color: Colors.yellow),*/
                        borderRadius: BorderRadius.circular(20),
                      ),

                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text(
                              "삭제",
                            ),
                            onTap: () {
                              print("삭제 버튼이 눌렸습니다.");
                            },
                          ),
                          PopupMenuItem(
                            child: Text(
                              "마감",
                            ),
                            onTap: () {
                              print("마감 버튼이 눌렸습니다.");
                            },
                          ),
                        ];
                      }),
                ),
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.all(4)),
                Text(
                  "트레이더스 공구 하실 분 구합니다.",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'images/flutter.png',
                  width: 250.0,
                  height: 250.0,
                ),
                Container(
                  child: Text(
                    "이마트 트레이더스에 파는 상품들이 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  child: Text(
                    "예정일 : 04/17/2023",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: 500,
                  child: Divider(color: Colors.yellow, thickness: 2.0),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
