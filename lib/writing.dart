import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'writing',
      debugShowCheckedModeBanner: false,
      home: JoinWidget(),
    );
  }
}

class JoinWidget extends StatefulWidget {
  const JoinWidget({Key? key}) : super(key: key);

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  bool _isLending = false;
  bool _isBorrowing = false;

  final picker = ImagePicker();
  List<XFile?> multiImage = [];
  List<XFile?> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        actions: [
          ElevatedButton(
            onPressed: (){
            },
            child: const Text('저장',style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xffFFE072),
      ),

      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 5.0),
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
                    });
                  },
                ),
                const Text("빌려 쓰기",
                  style: TextStyle(color: Colors.black),),
              ],
            ),
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
            margin: EdgeInsets.fromLTRB(30.0, 15.0, 300.0, 5.0),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.yellow.shade300, borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    );
  }
}

