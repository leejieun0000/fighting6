import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class GongguWrite extends StatefulWidget {
  const GongguWrite({Key? key}) : super(key: key);

  @override
  _GongWidgetState createState() => _GongWidgetState();
}

class _GongWidgetState extends State<GongguWrite> {
  final picker = ImagePicker();
  List<XFile?> multiImage = [];
  List<XFile?> images = [];

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기',
          style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold
          ),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  const SizedBox(width: 35,
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
            ),
            /* MultiImagesSelect(),*/
            Container(
                margin: EdgeInsets.fromLTRB(30.0, 15.0, 300.0, 5.0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Color(0xffFFE072), borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5),spreadRadius: 0.5,blurRadius: 5)],
                ),

                child: IconButton(
                    onPressed: () async {multiImage = await picker.pickMultiImage();
                    setState(() {
                      images.addAll(multiImage);
                    });
                    },
                    icon: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 30,
                      color: Colors.white,
                    )
                )
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder(padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
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
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
              ),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 30
                  ),
                  hintText: '상품의 세부설명을 입력해주세요.',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
             const Padding(
               padding: EdgeInsets.only(top: 100),
               child: Text(
                '예정일',
                style: TextStyle(fontSize: 20, color: Colors.black,),
            ),
             ),
            SizedBox(height: 10,),
            SizedBox(
              width: 320,
              height: 50,
              child:OutlinedButton(
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
                            primary: Color(0xffFFE072), // header background color
                            onPrimary: Colors.black, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black, // button text color
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
                      style: TextStyle(fontSize: 18, color: Colors.black,),
                      textAlign: TextAlign.left,
                    ),
                    Icon(Icons.date_range,
                      color: Color(0xffFFE072),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}