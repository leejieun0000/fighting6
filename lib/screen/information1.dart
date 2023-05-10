import 'package:flutter/material.dart';

/*void main() {
  runApp(const MyWidget());
}*/

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyWidget();
  }
}

class _MyWidget extends State<MyWidget> {
  Widget _getDataTable(){
    return DataTable(

      horizontalMargin: 12.0,// 가로 여백 설정
      columnSpacing: 28.0, //열 간격
      //dividerThickness: 2, 구분선 두께
      headingRowColor: MaterialStateColor.resolveWith((states) {return const Color(0xffFFF0A4);},),
      columns: [
        DataColumn(label: Text('제목',style: TextStyle(
          //fontStyle: FontStyle.~,
          //fontSize: 20,
        ),), ),
        DataColumn(label: Text('작성일')),
      ],
      rows: [
        DataRow(
            cells: [
              DataCell(Text('대전 청년 월세 지원')),
              DataCell(Text('2023.00.00')),
            ]
        ),
        DataRow(
            cells: [
              DataCell(Text('미혼 청년 주거 급여 분리 지급')),
              DataCell(Text('2023.00.00')),
            ]
        ),
      ],);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffFFE072),
            title: Text('자취 지원 정보',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            centerTitle: true,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                print("navigate");
              },
            ),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child : Container(
                margin: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: _getDataTable(),
                  ),
                )
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "notice"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "person"),
            ],
          ),
        ));
  }
}