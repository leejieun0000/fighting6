import 'package:flutter/material.dart';
import 'package:project1/LB_page.dart';
import 'package:project1/Landing_S.dart';
import 'package:project1/main.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 140,
                width: 180,
                margin: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
              ),
              Container(
                height: 140,
                width: 180,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
              ),
              Container(
                height: 140,
                width: 180,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 160,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Color(0xffBEBAB3), width: 3),
            color: Color(0xfff8f2ee),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LandingSetting()),
                    );
                  },
                  child: Image.asset("images/human.png",
                    height: 100,
                    width: 100,),
                ),
              ),
              Container(
                height: 160,
                width: 210,
                margin: EdgeInsets.only(top: 40, left: 10),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LandingSetting()),
                        );
                      },
                      child: Text(
                        '빌려 주기/쓰기',
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
          height: 160,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Color(0xffBEBAB3), width: 3),
            color: Color(0xfff8f2ee),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySwitch()),
                    );
                  },
                  child: Image.asset("images/cart.png",
                    height: 90,
                    width: 90,),
                ),
              ),
              Container(
                height: 160,
                width: 210,
                margin: EdgeInsets.only(top: 40, left: 20),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MySwitch()),
                        );
                      },
                      child: Text(
                        '공동 구매',
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
          height: 160,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySwitch()),
                    );
                  },
                  child: Image.asset("images/house.png",
                    height: 70,
                    width: 70,),
                ),
              ),
              Container(
                height: 160,
                width: 210,
                margin: EdgeInsets.only(top: 40, left: 20),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MySwitch()),
                        );
                      },
                      child: Text(
                        '자취 지원 정보',
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
    );
  }
}