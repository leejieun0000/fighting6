import 'package:flutter/material.dart';

void main() {
  runApp(Gonggu());
}

class Gonggu extends StatefulWidget {
  const Gonggu({super.key});

  @override
  _Gonggu createState() => _Gonggu();
}


class _Gonggu extends State<Gonggu> {

  final List<String> _valueList = ['궁동', '죽동', '봉명동', '어은동', '장대동', '신성동', '관평동', '어은동', '둔산동', '은행동'];
  String _selectedValue = '궁동';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffFFE072),
              title: const Text(
                '공동구매',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              elevation: 0.0,
              iconTheme: IconThemeData(colo r: Colors.black),
              leading: IconButton(
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.navigate_before),
                ),
                onPressed: () {
                  print("navigate");
                },
              ),
            ),
            body:

        )
    );
  }
}