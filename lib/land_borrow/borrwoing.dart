import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:project1/land_borrow/lending.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

/*void main() {
  runApp(Information());
}

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      home: Borrowing(),
    );
  }
}*/

// void main() {
//   runApp(Information());
// }
//
// class Information extends StatelessWidget {
//   const Information({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'login',
//       debugShowCheckedModeBanner: false,
//       home: Borrowing(),
//     );
//   }
// }


class Borrowing extends StatefulWidget {
  const Borrowing({super.key, required this.tabIndex});
  final int tabIndex;
  //const Borrowing({super.key});

  @override
  _borrowing createState() => _borrowing();
}


class _borrowing extends State<Borrowing> {

  String? selectedValue;
  List<String> items = [
    '궁동',
    '죽동',
    '봉명동',
    '어은동',
    '장대동',
    '신성동',
    '관평동',
    '어은동',
    '둔산동',
    '은행동'
  ];

  final List<Map<String, String>> _valueList_2 = [
    {
      'imagePath': 'images/ganjang.png',
      'title': '간장 한 번만 빌려주세요.',
      'date': '반납일',
    },
    {
      'imagePath': 'images/hanger.png',
      'title': '옷걸이 2개만 나눔해주실 천사 찾습니다.',
      'date': '반납일',
    },
    {
      'imagePath': 'images/bug.png',
      'title': '집에 바퀴가 나왔는데 못 잡겠어요.. 도와주세요..',
      'date': '반납일',
    }

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFE072),
        title: Text(
          '빌려주기/쓰기',
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
            Navigator.pushNamed(context, '/'
            );
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
                                  fontWeight: FontWeight.w500,
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
                        dropdownMaxHeight: 200,
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
          Row(
            children: [
              Container(
                width: 130,
                height: 50,
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/lending'
                    );
                  },
                  child: const Text('빌려주기'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black54,
                    backgroundColor: Color(0xffFFE072),
                    minimumSize: Size(300, 40),
                  ),
                ),
              ),

              Container(
                width: 130,
                height: 50,
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 20.0, 10.0),
                child: ElevatedButton(
                  onPressed: (){
                  },
                  child: const Text('빌려쓰기'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    backgroundColor: Color(0xffFFE072),
                    minimumSize: Size(300, 40),
                  ),
                ),
              ),
            ],
          ),

          Divider(
            color: Colors.black,  // 원하는 색상을 설정합니다.
            thickness: 1,  // 원하는 두께를 설정합니다.
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 10 * 3,
                  thickness: 1.5,
                  color: Colors.grey[300],
                  indent: 10,
                );
              },
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) {
                // 현재 인덱스에 해당하는 항목을 가져옵니다.
                final item = _valueList_2[index];
                return SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Image.asset(
                        item['imagePath']!, // 이미지 경로를 동적으로 설정합니다.
                        width: 110,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                item['title']!, // 제목을 동적으로 설정합니다.
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 7),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(item['date']!), // 날짜를 동적으로 설정합니다.
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
          ),

          Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 50,
                onPressed: (){
                  Navigator.pushNamed(context, '/writingWidget'
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
