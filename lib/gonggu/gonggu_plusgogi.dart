import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:project1/gonggu/groupPurchase_detail.dart';

void main() {
  runApp(NewGonggu());
}

class NewGonggu extends StatefulWidget {
  const NewGonggu({Key? key}) : super(key: key);

  @override
  _Gonggu createState() => _Gonggu();
}

class _Gonggu extends State<NewGonggu> {

  String? selectedValue;
  List<String> items = [
    '궁동',
    '죽동',
    '봉명동',
    '어은동',
    '장대동',
    '신성동',
  ];

  CollectionReference usersRef = FirebaseFirestore.instance.collection("post");


  void _navigateToDetailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GongguDetail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '공동구매',
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
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  width: 120,
                  height: 80,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                '궁동',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        itemHeight: 40,
                        //itemWidth: 200,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 180,
                        dropdownPadding: null,
                        /*dropdownBorderRadius: BorderRadius.circular(14),
                                  dropdownBorder: null,
                                  dropdownColor: Colors.redAccent,
                                  elevation: 8,*/
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(0, 0),
                      ),
                    ),
                  ),
                ),
              )
          ),
          Divider(
            color: Colors.black,  // 원하는 색상을 설정합니다.
            thickness: 1,  // 원하는 두께를 설정합니다.
          ),
          StreamBuilder<QuerySnapshot>(
            stream: usersRef.where('category', isEqualTo: 3).where('town', isEqualTo: '궁동').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 15,
                            thickness: 1,
                            color: Colors.grey[200],
                            indent: 5,
                            endIndent: 5,
                          );
                        },
                        // padding: EdgeInsets.all(16),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document = snapshot.data!.docs[index];
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          String title = data['title'] ?? '';
                          int category = data['category'] ?? '';
                          // DateTime day = data['day'] ?? '';
                          String detail = data['detail'] ?? '';
                          String image_url = data['image_url'] ?? '';
                          String userid = data['userid'] ?? '';
                          String dead_line = data['dead_line'] ?? '';

                          return InkWell(
                            onTap: () {
                              // 상세 페이지로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    category: category,
                                    // day: day,
                                    detail: detail,
                                    image_url: image_url,
                                    title: title,
                                    userid: userid,
                                    dead_line: dead_line,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 150,
                              child: Row(
                                children: [
                                  Image.network(
                                    image_url,
                                    width: 80,
                                    height: 140,
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 30),
                                        Text(title,
                                          style: TextStyle(fontSize: 23, ),
                                        ),
                                        SizedBox(height: 50),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(dead_line,
                                              style: TextStyle(fontSize: 17, ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 50,
                onPressed: (){
                  Navigator.pushNamed(context, '/GongguWrite'
                  );
                },
                icon: Image.asset(
                  "images/pen.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  bool lending_ing = false;

  final int category;
  // final DateTime day;
  final String detail;
  final String image_url;
  final String title;
  final String userid;
  final String dead_line;

  DetailPage({
    required this.category,
    // required this.day,
    required this.detail,
    required this.image_url,
    required this.title,
    required this.userid,
    required this.dead_line,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(4)),
            Text('$title',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Image.network(
                image_url,
                width: 380,
                height: 250,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Text(
                '$detail',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                '반납 날짜 : $dead_line',
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
