import 'package:flutter/material.dart';
import 'package:project1/gonggu/gonggu_magam.dart';

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
      home: GongguDetail(),
    );
  }

}

class GongguDetail extends StatefulWidget {
  const GongguDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GongguDetailState();
  }
}

class _GongguDetailState extends State<GongguDetail> {
  bool end = false;
  bool delete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            end
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GongguMagam()))
                : Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                cardColor: const Color(0xffFFF0A4),
              ),
              child: PopupMenuButton<Text>(
                icon: const Icon(Icons.menu),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("삭제"),
                      onTap: () {
                        print("삭제 버튼이 눌렸습니다.");
                        delete = true;
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("마감"),
                      onTap: () {
                        print("마감 버튼이 눌렸습니다.");
                        setState(() {
                          end = true;
                        });
                      },
                    ),
                  ];
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(4)),
            const Text(
              "트레이더스 공구 하실 분 구합니다.",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            end
                ? Container(
                    width: 380,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xff60597B),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.2), // 투명도를 나타내는 Color 객체 사용
                          BlendMode.dstATop,
                        ),
                        image: AssetImage('images/emart.png'),
                      ),
                    ),
                    child: Center(
                      child: const Text(
                        '마감',
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  )
                : Container(
                    width: 380,
                    height: 250,
                    child: Image.asset(
                      'images/emart.png',
                      fit: BoxFit.fill,
                    ),
                  ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "이마트 트레이더스에 파는 상품들이 혼자 먹기에는 양이 너무 많아서 공구 하실 분을 찾습니다! "
                "같이 장 보러 가셔도 좋고, 사고 싶으신 물품을 저와 상의하셔도 좋습니다.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "예정일 : 04/17/2023",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 500,
              child: const Divider(color: Colors.yellow, thickness: 2.0),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "qwer",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "저랑 가요!",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "afsd",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text(
                      "언제 시간되시나요?",
                      style: TextStyle(fontSize: 15),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 30
                ),
                hintText: '댓글쓰기',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
          ],
        ),
      ),
    );
  }
}
