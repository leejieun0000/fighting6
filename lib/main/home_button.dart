
import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({Key? key, required this.tabIndex}) : super(key: key);

  final int tabIndex;

  @override
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;
  double _indicatorPosition = 0;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
      _indicatorPosition = _scrollOffset / _scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left:30, bottom: 5),
          child: const Text(
            '자취생 도우미',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: [
                  Container(
                    height: 140,
                    width: 220,
                    margin: EdgeInsets.all(13),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Color(0xffBEBAB3), width: 3),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 15,
                          child: Image.asset(
                            "images/bell.png",
                            width: 35,
                            height: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 220,
                    margin: EdgeInsets.all(13),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Color(0xffBEBAB3), width: 3),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 15,
                          child: Image.asset(
                            "images/bell.png",
                            width: 35,
                            height: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 220,
                    margin: EdgeInsets.all(13),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Color(0xffBEBAB3), width: 3),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 15,
                          child: Image.asset(
                              "images/bell.png",
                              width: 35,
                              height: 35,
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 7,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xffFFF5EE),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Color(0xffBEBAB3), // 테두리 색상
                width: 0.3, // 테두리 두께
              ),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: (MediaQuery.of(context).size.width * 0.3 - 300) / 2 +
                      MediaQuery.of(context).size.width * _indicatorPosition.clamp(0, 0.65),
                  bottom: 0,
                  child: Container(
                    height: 7,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(
                        color: Color(0xffBEBAB3), // 테두리 색상
                        width: 0.3, // 테두리 두께
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(20, 20 , 20, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Color(0xffBEBAB3), width: 3),
              color: Color(0xfff8f2ee),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/lending'
                      );
                    },
                    child: Image.asset("images/landing.png",
                      height: 70,
                      width: 70,),
                  ),
                ),
                Container(
                  height: 150,
                  width: 210,
                  margin: EdgeInsets.only(top: 40, left: 10),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/lending'
                          );
                        },
                        child: Text(
                          '빌려 주기/쓰기',
                          style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '자취생 이웃과 필요한 것들을 공유해요',
                        style: TextStyle(fontSize: 13, color: Colors.black,),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Color(0xffBEBAB3), width: 3),
              color: Color(0xfff8f2ee),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/Gonggu'
                      );
                    },
                    child: Image.asset("images/shopping.png",
                      height: 70,
                      width: 70,),
                  ),
                ),
                Container(
                  height: 150,
                  width: 210,
                  margin: EdgeInsets.only(top: 40, left: 20),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/Gonggu'
                          );
                        },
                        child: Text(
                          '공동 구매',
                          style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '필요한 물건을 함께 구매해요',
                        style: TextStyle(fontSize: 13, color: Colors.black,),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Color(0xffBEBAB3), width: 3),
              color: Color(0xfff8f2ee),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/Information'
                      );
                    },
                    child: Image.asset("images/house.png",
                      height: 70,
                      width: 70,),
                  ),
                ),
                Container(
                  height: 150,
                  width: 210,
                  margin: EdgeInsets.only(top: 40, left: 20),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/Information'
                          );
                        },
                        child: Text(
                          '자취 지원 정보',
                          style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '자취생에게 유용한 정보를 드려요',
                        style: TextStyle(fontSize: 13, color: Colors.black,),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}