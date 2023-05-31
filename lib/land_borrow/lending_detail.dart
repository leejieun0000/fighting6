import 'package:flutter/material.dart';
import 'package:project1/land_borrow/Landing_S.dart';

class LendingDetail extends StatefulWidget {
  const LendingDetail({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  _LendingDetailState createState() => _LendingDetailState(tabIndex: tabIndex);
}

class _LendingDetailState extends State<LendingDetail> {
  _LendingDetailState({required this.tabIndex});
  final int tabIndex;
  bool delete = false;
  bool lending_ing = false;
  bool lending_ok = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                cardColor: const Color(0xffFFF0A4),
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("삭제"),
                      value: "delete",
                    ),
                    PopupMenuItem(
                      child: const Text("대여중"),
                      value: "lending_ing",
                    ),
                    PopupMenuItem(
                      child: const Text("대여가능"),
                      value: "lending_ok",
                    ),
                  ];
                },
                onSelected: (value) {
                  setState(() {
                    if (value == "delete") {
                      print("삭제 버튼이 눌렸습니다.");
                      delete = true;
                    } else if (value == "lending_ing") {
                      lending_ing = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingSetting(tabIndex: tabIndex),
                        ),
                      );
                    } else if (value == "lending_ok") {
                      lending_ok = true;
                    }
                  });
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
              "드라이버 빌려 드립니다.",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            lending_ing
                ? Container(
              width: 380,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xff60597B),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.2),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage('images/driver.png'),
                ),
              ),
              child: Center(
                child: const Text(
                  '대여중',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            )
                : Container(
              width: 380,
              height: 250,
              child: Image.asset(
                'images/driver.png',
                fit: BoxFit.fill,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~ 드라이버 빌려드립니다.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "반납 날짜 : 04/17/2023",
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
                    "저 필요해요!!",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
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



/*
import 'package:flutter/material.dart';
import 'package:project1/land_borrow/Landing_S.dart';

class LendingDetail extends StatefulWidget {
  const LendingDetail({Key? key, required this.tabIndex, this.write = false}) : super(key: key);
  final int tabIndex;
  final bool write;

  @override
  _LendingDetailState createState() => _LendingDetailState(tabIndex: tabIndex);
}

class _LendingDetailState extends State<LendingDetail> {
  _LendingDetailState({required this.tabIndex});
  final int tabIndex;
  bool delete = false;
  bool lending_ing = false;
  bool lending_ok = false;

  @override
  Widget build(BuildContext context) {
    bool write2 = widget.write;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                cardColor: const Color(0xffFFF0A4),
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("삭제"),
                      value: "delete",
                    ),
                    PopupMenuItem(
                      child: const Text("대여중"),
                      value: "lending_ing",
                    ),
                    PopupMenuItem(
                      child: const Text("대여가능"),
                      value: "lending_ok",
                    ),
                  ];
                },
                onSelected: (value) {
                  setState(() {
                    if (value == "delete") {
                      print("삭제 버튼이 눌렸습니다.");
                      delete = true;
                    } else if (value == "lending_ing") {
                      lending_ing = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingSetting(tabIndex: tabIndex),
                        ),
                      );
                    } else if (value == "lending_ok") {
                      lending_ok = true;
                    }
                  });
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
              "드라이버 빌려 드립니다.",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            lending_ing && write2
                ? Container(
              width: 380,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xff60597B),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.2),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage('images/driver.png'),
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
                'images/driver.png',
                fit: BoxFit.fill,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~ 드라이버 빌려드립니다.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "반납 날짜 : 04/17/2023",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 500,
              child: const Divider(color: Colors.yellow, thickness: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
*/
