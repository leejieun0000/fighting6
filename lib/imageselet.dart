import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseData {
  final int category;
  final DateTime day;
  final String detail;
  final String image_url;
  final String title;
  final String userid;
  final String dead_line;
  final String town;


  FirebaseData({
    required this.category,
    required this.day,
    required this.detail,
    required this.image_url,
    required this.title,
    required this.userid,
    required this.dead_line,
    required this.town,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'day': day,
      'detail': detail,
      'image_url': image_url,
      'title': title,
      'userid': userid,
      'dead_line': dead_line,
      'town': town,
    };
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ImageSelectionScreen());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '글쓰기',
//       home: ImageSelectionScreen(),
//     );
//   }
// }

class ImageSelectionScreen extends StatefulWidget {
  const ImageSelectionScreen({Key? key}) : super(key: key);

  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  bool _isLending = false;
  bool _isBorrowing = false;
  bool _isGonggu = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

  List<String> _imageUrls = [];
  int Number = 0;
  DateTime date = DateTime.now();
  File? _imageFile;
  String? _uploadedImageUrl;

  final picker = ImagePicker();

  String town = "";
  String? selectedValue;
  List<String> items = [
    '궁동',
    '죽동',
    '봉명동',
    '어은동',
    '장대동',
    '신성동',
  ];

  void showToast(BuildContext context, String message, IconData iconData) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Color(0xfffd9b13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(iconData, color: Colors.white),
                  SizedBox(width: 10),
                  Text(message, style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ],
      ),
    ));

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }

  Future _selectImages() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    if (_imageFile == null) {
      print('No image selected.');
      return;
    }

    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.png');

      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _uploadedImageUrl = downloadUrl;
      });

      print('Image uploaded. Download URL: $_uploadedImageUrl');
      showToast(context, '이미지 저장에 성공하였습니다!', Icons.check);

      // Build the UI after uploading the image
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {});
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      return userId;
    } else {
      // 사용자가 인증되지 않았을 경우 처리
      return 'NO USER';
    }
  }

  Future<void> setDocument(FirebaseData data) async {

    FirebaseFirestore.instance
        .collection('post')
        .doc(data.title)
        .set(data.toMap())
        .then((value) {
      setState(() {
        // 성공 처리
        // 예: 텍스트를 업데이트하거나 UI를 변경하는 등의 작업 수행
        print('Success!');
      });
    })
        .catchError((error) {
      setState(() {
        // 실패 처리
        // 예: 오류 메시지를 표시하거나 에러 처리 작업 수행
        print('Fail!');
      });
    });
  }

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
                setDocument(
                  FirebaseData(
                    category: Number,
                    day: DateTime.now(),
                    detail: _detailController.text,
                    title: _titleController.text,
                    image_url: '$_uploadedImageUrl',
                    userid: getUserId(),
                    dead_line: "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                    town: town,
                  ),
                );
                Navigator.pop(context);
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
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
                          town = value;
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
                          Number = 1;
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
                          Number = 2;
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
                          Number = 3;
                        });
                      },
                    ),
                    const Text("공동구매",
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
                      controller: _titleController,
                      decoration: InputDecoration(
                        isDense: true,
                      ),
                    ),
                    width: 250,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 15.0, 15.0, 20.0),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.yellow.shade300, borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5),spreadRadius: 0.5,blurRadius: 5)],
                    ),

                    child: Column(
                      children: [
                        IconButton(
                            onPressed: _selectImages,
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
                    margin: EdgeInsets.fromLTRB(30.0, 15.0, 15.0, 20.0),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.yellow.shade300, borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5),spreadRadius: 0.5,blurRadius: 5)],
                    ),

                    child: Column(
                      children: [
                        IconButton(
                            onPressed: uploadImage,
                            icon: Icon(
                              Icons.upload_file,
                              size: 30,
                              color: Colors.white,
                            )
                        ),
                        Container(
                          //padding: EdgeInsets.only(top: 50),
                          child: Text(
                            '이미지 저장',
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
                ],
              ),
              SizedBox(width: 20,),
              _imageFile != null
                  ? Image.file(
                _imageFile!,
                height: 200,
              )
                  : Placeholder(
                fallbackHeight: 0,
                // fallbackWidth: double.infinity,
              ),
              TextFormField(
                controller: _detailController,
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
          ),
        ),
      ),
    );
  }
}