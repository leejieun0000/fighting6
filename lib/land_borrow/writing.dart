import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class writingWidget extends StatefulWidget {
  const writingWidget({Key? key}) : super(key: key);

  @override
  _writingWidgetState createState() => _writingWidgetState();
}

class _writingWidgetState extends State<writingWidget> {
  bool _isLending = false;
  bool _isBorrowing = false;
  bool _isGonggu = false;

  final picker = ImagePicker();
  List<XFile?> multiImage = [];
  List<XFile?> images = [];
  DateTime date = DateTime.now();

  String? selectedValue;
  List<String> items = [
    '궁동',
    '죽동',
    '봉명동',
    '어은동',
    '장대동',
    '신성동',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: MaterialButton(
              minWidth: 60,
              color: Colors.white,
              onPressed: () {
                //저장하기~
              },
              child: Text('저장'),
              shape: RoundedRectangleBorder( // 테두리를 둥글게 만들기 위한 설정
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Container(
                  width: 120,
                  height: 50,
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
                                  fontSize: 20,
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
                                  fontSize: 20,
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
                        buttonHeight: 40,
                        buttonWidth: 160,
                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xffFFE072),

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
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 5.0),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Color(0xffFFE072),
                  checkColor: Colors.white,
                  value: _isLending,
                  onChanged: (value) {
                    setState(() {
                      _isLending = value!;
                      _isBorrowing = !value;
                      _isGonggu = !value;
                    });
                  },
                ),
                const Text("빌려주기",
                  style: TextStyle(color: Colors.black),),
                Checkbox(
                  activeColor: Color(0xffFFE072),
                  checkColor: Colors.white,
                  value: _isBorrowing,
                  onChanged: (value) {
                    setState(() {
                      _isBorrowing = value!;
                      _isLending = !value;
                      _isGonggu = !value;
                    });
                  },
                ),
                const Text("빌려쓰기",
                  style: TextStyle(color: Colors.black),),
                Checkbox(
                  activeColor: Color(0xffFFE072),
                  checkColor: Colors.white,
                  value: _isGonggu,
                  onChanged: (value) {
                    setState(() {
                      _isLending = !value!;
                      _isBorrowing = !value;
                      _isGonggu = value;
                    });
                  },
                ),
                const Text("공동구매",
                  style: TextStyle(color: Colors.black),),
              ],
            ),
          ),

          Divider(
            color: Colors.black,  // 원하는 색상을 설정합니다.
            thickness: 1,  // 원하는 두께를 설정합니다.
          ),


          Row(
            children: [
              SizedBox(width: 35,
              ),
              new Text(
                '제목 : ',
                style: TextStyle(fontSize: 20, color: Colors.black,),
              ),
              SizedBox(width: 20,),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                  ),
                ),
                width: 250,
              ),
            ],
          ),
         /* MultiImagesSelect(),*/
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 30.0, 300.0, 5.0),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.yellow.shade300, borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5),spreadRadius: 0.5,blurRadius: 5)],
            ),

            child: Column(
              children: [
                IconButton(
                    onPressed: () async {
                      multiImage = await picker.pickMultiImage();
                    setState(() {
                      images.addAll(multiImage);
                    });
                    },
                    icon: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 30,
                      color: Colors.white,
                    )
                ),
                Container(
                  //padding: EdgeInsets.only(top: 50),
                  child: Text(
                    '이미지 추가',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),

          ),
          Container(
            margin: EdgeInsets.all(10),
            child: GridView.builder(padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: images.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio:
                1 / 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image:
                          DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(images[index]!.path
                              ))
                          )
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                          BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.close,
                              color: Colors.white,
                              size: 15),
                          onPressed: () {
                            setState(() {
                              images.remove(images[index]);
                            });
                          },
                        )
                    )
                  ],
                );
              },
            ),
          ),
          TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
               contentPadding: EdgeInsets.symmetric(
                 horizontal: 30
               ),
              hintText: '상품의 세부설명을 입력해주세요.',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
              child: Column(
                children: [
                  Text(
                    '반납 예정일',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: Color(
                                      0xffEDDFBC), // header background color
                                  onPrimary: Colors.black, // header text color
                                  onSurface: Colors.black, // body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                    Colors.black, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (selectedDate != null) {
                          setState(() {
                            date = selectedDate;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            Icons.date_range,
                            color: Color(0xffEDDFBC),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

