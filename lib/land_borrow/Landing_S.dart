import 'package:flutter/material.dart';

class LandingSetting extends StatefulWidget {
  const LandingSetting({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  _LandingSettingState createState() => _LandingSettingState();
}

class _LandingSettingState extends State<LandingSetting> {
  DateTimeRange dateTimeRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now()
  );

  @override
  Widget build(BuildContext context) {
    final start = dateTimeRange.start;
    final end = dateTimeRange.end;

    return Scaffold(
      appBar: AppBar(
        title: const Text('대여중',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.check),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  SizedBox(width: 35,
                  ),
                  new Text(
                      '물품 : ',
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
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  SizedBox(width: 35,
                  ),
                  new Text(
                    '빌려주는 사람 : ',
                    style: TextStyle(fontSize: 20, color: Colors.black,),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                      ),
                    ),
                    width: 200,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  SizedBox(width: 35,
                  ),
                  new Text(
                    '빌리는 사람 : ',
                    style: TextStyle(fontSize: 20, color: Colors.black,),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                      ),
                    ),
                    width: 200,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30,),
              // alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '대여 날짜',
                    style: TextStyle(fontSize: 20, color: Colors.black,),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () async {
                          DateTimeRange? BorrowDate = await showDateRangePicker(
                            context: context,
                            initialDateRange: dateTimeRange,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                          );
                          if (BorrowDate != null){
                            setState(() {
                              dateTimeRange = BorrowDate;
                            });
                          }
                        },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${start.year.toString()}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}',
                            style: TextStyle(fontSize: 18, color: Colors.black,),
                            textAlign: TextAlign.left,
                          ),
                          Icon(Icons.date_range),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    '반납 예정 날짜',
                    style: TextStyle(fontSize: 20, color: Colors.black,),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () async {
                        DateTimeRange? BorrowDate = await showDateRangePicker(
                          context: context,
                          initialDateRange: dateTimeRange,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          // locale: const Locale('ko', 'KR'),
                        );
                        if (BorrowDate != null){
                          setState(() {
                            dateTimeRange = BorrowDate;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${end.year.toString()}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
                            style: TextStyle(fontSize: 18, color: Colors.black,),
                            textAlign: TextAlign.left,
                          ),
                          Icon(Icons.date_range),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}