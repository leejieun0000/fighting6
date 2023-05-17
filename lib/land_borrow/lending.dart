import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(lending());
}

class lending extends StatefulWidget {
  const lending({Key? key}) : super(key: key);

  @override
  _lending createState() => _lending();
}


class _lending extends State<lending> {

  final List<String> _valueList_1 = [
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
  String _selectedValue_1 = '궁동';

  final List<Map<String, String>> _valueList_2 = [
    {
      'imagePath': 'images/driver.png',
      'title': '드라이버 빌려드립니다',
      'date': '반납일',
    },
    {
      'imagePath': 'images/grape.png',
      'title': '선물 받았는데 너무 많아서 포도 나눔합니다.',
      'date': '반납일',
    },
    {
      'imagePath': 'images/bug.png',
      'title': '벌레 잡아드립니다.',
      'date': '반납일',
    }

  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              Navigator.pop(context);
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
                        child: DropdownButton(
                          isExpanded: true,
                          value: _selectedValue_1,
                          items: _valueList_1.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 30,
                                    fontWeight: FontWeight.w900),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedValue_1 = value!;
                            });
                          },
                        ),
                      ),
                    )
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
                    },
                    child: const Text('빌려주기'),
                    style: ElevatedButton.styleFrom(
                      onPrimary:  Colors.black54,
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
                      Navigator.pushNamed(context, '/Borrowing'
                      );
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

                  },
                    icon: Image.asset(
                      "images/pen.png",
                 ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
