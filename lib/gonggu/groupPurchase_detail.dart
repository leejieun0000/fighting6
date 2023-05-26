import 'package:flutter/material.dart';

// void main() {
//   runApp(const GongguDetail());
// }


class GongguDetail extends StatefulWidget {
  const GongguDetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GongguDetail();
  }
}

class _GongguDetail extends State<GongguDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
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
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(4)),
            Text(
              "트레이더스 공구 하실 분 구합니다.",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(4)),
            Container(
              width: 380,
              height: 250,
              child:
              Image.asset(
                          'images/emart.png',
                          fit: BoxFit.fill,
                          width: 380,
                          height: 250,
                        ),
              //마감 버튼 눌렀을 때
              /*Container(
                width: 380,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xff60597B),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: AssetImage('images/emart.png'
                    ),
                  ),
                ),
                child: Text('마감',
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.center), //가운데 정렬이 안 먹힘... ^^
              ),*/

            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Text(
                "이마트 트레이더스에 파는 상품들이 혼자 먹기에는 양이 너무 많아서 공구 하실 분을 찾습니다! "
                    "같이 장 보러 가셔도 좋고, 사고 싶으신 물품을 저와 상의하셔도 좋습니다.",
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
    );
  }
}
