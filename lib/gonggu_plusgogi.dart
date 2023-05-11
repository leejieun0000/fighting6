import 'package:flutter/material.dart';

void main() {
  runApp(Gonggu());
}

class Gonggu extends StatefulWidget {
  const Gonggu({super.key});

  @override
  _Gonggu createState() => _Gonggu();
}


class _Gonggu extends State<Gonggu> {

  final List<String> _valueList = ['궁동', '죽동', '봉명동', '어은동', '장대동', '신성동', '관평동', '어은동', '둔산동', '은행동'];
  String _selectedValue = '궁동';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffFFE072),
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
                  print("navigate");
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
                          height: 100,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DropdownButton(
                              isExpanded: true,
                              value: _selectedValue,
                              items: _valueList.map((value) {
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
                                  _selectedValue = value!;
                                });
                              },
                            ),
                          ),
                        )
                    )
                ),
                Container(
                  width: 380,
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/gogi.png",
                                width: 110,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 20),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '고기 먹으러 같이 가실 분 구합니다.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('예정일: 04/18/2023'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/emart.png",
                                width: 110,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 20),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '트레이더스 공구 하실 분 구합니다.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('예정일: 04/17/2023'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        ,
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/bokeumbop.png",
                                width: 110,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 20),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '냉동 볶음밥 공구 하실 분 구합니다.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('예정일: 04/13/2023'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 150,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/chicken.png",
                                width: 110,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 20),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OO아파트 치킨 같이 시키실 분~!',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('예정일: 04/12/2023'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  ),


                Container(
                  margin: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "images/pen.png",
                      width: 70,

                    ),
                  ),
                )



              ],
            )
        )

    );
  }
}