import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_core/firebase_core.dart';

class FirebaseData {
  final int category;
  final DateTime day;
  final String detail;
  final String image_url;
  final String title;
  final String userid;
  final String dead_line;


  FirebaseData({
    required this.category,
    required this.day,
    required this.detail,
    required this.image_url,
    required this.title,
    required this.userid,
    required this.dead_line,
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
    };
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Upload Demo',
      home: ImageSelectionScreen(),
    );
  }
}

class ImageSelectionScreen extends StatefulWidget {
  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> _imageUrls = [];
  List<XFile> _selectedImages = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  int Number = 0;
  File? selectedImage;
  bool _isLending = false;
  bool _isBorrowing = false;
  bool _isGonggu = false;
  String imagesUrl = "";
  DateTime date = DateTime.now();

  Future<String> uploadImageToFirebase(File file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString(); // 파일명을 고유하게 생성
    String pathName = _titleController.text;
    Reference storageReference = FirebaseStorage.instance.ref().child('$pathName/$fileName');
    UploadTask uploadTask = storageReference.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    setState(() {
      _imageUrls.add(imageUrl);
    });

    return imageUrl;
  }

  Future<List<XFile>> getImagesFromGallery() async {
    final picker = ImagePicker();
    List<XFile> selectedImages = [];

    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      for (XFile pickedFile in pickedFiles) {
        selectedImages.add(pickedFile);
      }
    }

    return selectedImages;
  }

  void _selectImages() async {
    List<XFile> imageFiles = await getImagesFromGallery();
    if (imageFiles.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(imageFiles);
      });
    }
  }

    void _saveImages() async {
    List<String> imageUrls = [];
    for (XFile imageFile in _selectedImages) {
      File file = File(imageFile.path);
      String imageUrl = await uploadImageToFirebase(file);
      imageUrls.add(imageUrl);
    }

    setState(() {
      _imageUrls.addAll(imageUrls);
    });
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
    _saveImages();

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
        title: Text('Image Upload Demo'),
        actions: [
          IconButton(
              // onPressed: _saveImages,
            onPressed: () {
              setDocument(
                FirebaseData(
                  category: Number,
                  day: DateTime.now(),
                  detail: _detailController.text,
                  title: _titleController.text,
                  image_url: "imagesUrl",
                  userid: getUserId(),
                  dead_line: "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                ),
              );
            },
              icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _imageUrls.map((imageUrl) {
                  return Image.network(
                    imageUrl,
                    height: 200,
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
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
              ElevatedButton(
                onPressed: _selectImages,
                child: Text('Select Images'),
              ),
              // ElevatedButton(
              //   onPressed: _saveImages,
              //   child: Text('Upload Images'),
              // ),
              Container(
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: _selectedImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    XFile imageFile = _selectedImages[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: FileImage(File(_selectedImages[index].path)),
                          image: FileImage(File(imageFile.path)),
                        ),
                      ),
                    );
                  },
                ),
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