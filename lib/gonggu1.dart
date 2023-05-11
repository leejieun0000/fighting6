import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Gonggu extends StatefulWidget {
  const Gonggu({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Gonggu();
  }
}
class _Gonggu extends State<Gonggu> {
  final List<String> items = [
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
  String? selectedValue;

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
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                print("navigate");
              },
            ),
          ),
          body: Column(
              children: [
                Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                              ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                        ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.redAccent,
                      ),
                      elevation: 2,
                    ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.yellow,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.redAccent,
                      ),
                      elevation: 8,
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      )),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
                ),

                Container(
                    height: 150,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset('emart.png', width: 150,),
                        Container(
                          child: Column(
                            children: [
                              Text('트레이더스 공구 하실 분 구합니다.'),
                              Text('예정일: 04/17/2023')
                            ],
                          ),
                        )
                      ],
                    )
                ),
                Container(
                    height: 150,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset('bokeumbop.png', width: 150,),
                        Container(
                          child: Column(
                            children: [
                              Text('냉동 볶음밥 공구 하실 분 구합니다.'),
                              Text('예정일: 04/13/2023')
                            ],
                          ),
                        )
                      ],
                    )
                ),
                Container(
                    height: 150,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset('chicken.png', width: 150,),
                        Container(
                          child: Column(
                            children: [
                              Text('OO아파트 치킨 같이 시키실 분~!'),
                              Text('예정일: 04/12/2023')
                            ],
                          ),
                        )
                      ],
                    )
                )
              ]),
        ),
      );
    }
  }
