import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'writing',
//       debugShowCheckedModeBanner: false,
//       home: JoinWidget(),
//     );
//   }
// }

class JoinWidget extends StatefulWidget {
  const JoinWidget({Key? key}) : super(key: key);

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  bool _isLending = false;
  bool _isBorrowing = false;

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
              minimumSize: Size(1, 1),
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
          TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
               contentPadding: EdgeInsets.symmetric(
                 horizontal: 30
               ),
              hintText: '상품의 세부설명을 입력해주세요.',
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border,
            ),
          ),
        ],
      ),
    );
  }
}

class MultiImagesSelect extends StatelessWidget {
  const MultiImagesSelect({
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal
    );
  }
}

