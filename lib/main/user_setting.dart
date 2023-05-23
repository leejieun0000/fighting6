import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return _UserSetting(tabIndex: tabIndex);
  }
}

class _UserSetting extends StatelessWidget {
  const _UserSetting({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '내 정보',
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
         Container(
           height: 70,
           margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
           child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFBF8F6), // 버튼의 배경색
                  onPrimary: Colors.black, // 버튼의 텍스트 / 아이콘 색
                  side: BorderSide(color: Color(0xffBEBAB3), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                  ),// 버튼의 테두리 색
                ),
                onPressed: () {},
                child: const Row( // Row 위젯을 사용해 아이콘과 텍스트를 가로로 배열
                  mainAxisAlignment: MainAxisAlignment.start, // 가로로 정렬
                  children: <Widget>[
                    Image(
                      image:AssetImage("images/paper.png"),
                      width: 70,
                      height: 70,
                    ), // 아이콘 추가
                    SizedBox(width: 10), // 아이콘과 텍스트 사이의 간격
                    Text('내가 쓴 글',
                      style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,),) // 텍스트 추가
                  ],
                ),
              ),
         ),
          Container(
            height: 70,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFBF8F6), // 버튼의 배경색
                onPrimary: Colors.black, // 버튼의 텍스트 / 아이콘 색
                side: BorderSide(color: Color(0xffBEBAB3), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                ),// 버튼의 테두리 색
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/InformationChange'
                );
              },
              child: const Row( // Row 위젯을 사용해 아이콘과 텍스트를 가로로 배열
                mainAxisAlignment: MainAxisAlignment.start, // 가로로 정렬
                children: <Widget>[
                  Image(
                    image:AssetImage("images/person.png"),
                    width: 70,
                    height: 70,
                  ), // 아이콘 추가
                  SizedBox(width: 10), // 아이콘과 텍스트 사이의 간격
                  Text('회원 정보 수정',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,),) // 텍스트 추가
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFBF8F6), // 버튼의 배경색
                onPrimary: Colors.black, // 버튼의 텍스트 / 아이콘 색
                side: BorderSide(color: Color(0xffBEBAB3), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                ),// 버튼의 테두리 색
              ),
              onPressed: () {},
              child: const Row( // Row 위젯을 사용해 아이콘과 텍스트를 가로로 배열
                mainAxisAlignment: MainAxisAlignment.start, // 가로로 정렬
                children: <Widget>[
                  Image(
                    image:AssetImage("images/lock.png"),
                    width: 70,
                    height: 70,
                  ), // 아이콘 추가
                  SizedBox(width: 10), // 아이콘과 텍스트 사이의 간격
                  Text('비밀번호 변경',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,),) // 텍스트 추가
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
