import 'package:flutter/material.dart';

void main() {
  runApp(const MySwitch());
}

class MySwitch extends StatefulWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  //스위치의 상태를 받을 수 있는 변수 만들기
  var swtichvalue = false;
  var textSwitch = '';
  var textButton = '';

  List<String> drop = ['Hello', 'Flutter', 'BasicProjectLab'];
  String selectedDrop = 'Hello';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello~~~!!!")),
        body: Center(
            child: Column(//가운데에 열을 만듦
                children: <Widget>[
          Switch(
            value: swtichvalue, // 스위치가 on off일 때마다 그 값이 value에 저장
            onChanged: (bool value) {
              //상태 변경이 이루어지면 setState() 발생
              setState(() {
                swtichvalue = value;
                textSwitch = "switch value $swtichvalue";
              });
            },
          ),
          Text(
            textSwitch,
            style: TextStyle(fontSize: 30),
          ), //출력하는 부분
          ElevatedButton(
            onPressed: () {
              setState(() {
                // 눌러지면 setState() 발생
                textButton = textButton == "Hello" ? "Flutter" : "Hello";
              });
            },
            child: Text(textButton),//버튼 위에 글자 출력하는 부분인 듯
          ),
            Text(textButton),
            DropdownButton(
                value: selectedDrop,
                items: drop.map((String item){
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                  selectedDrop = value;
                });
                    },),
            Text('selected : $selectedDrop'),
        ],
      )),
      ),
    );
  }
}
