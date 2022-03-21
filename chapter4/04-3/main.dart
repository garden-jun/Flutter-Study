import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '_title',
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({Key? key}) : super(key: key);

  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems =
      new List.empty(growable: true);
  String? _buttonText;

  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공학용 계산기'),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '근데 사칙연산만 됨 ㅋㅋ\n어차피 님들 공학용계산기로 사칙연산밖에 안하잖아요ㅋㅋ\n\n\n\n결과: $sum',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  keyboardType: TextInputType.number, controller: value1),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  keyboardType: TextInputType.number, controller: value2),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  child: Row(
                    children: <Widget>[Icon(Icons.add), Text(_buttonText!)],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    setState(() {
                      var value1Int = double.parse(value1.value.text);
                      var value2Int = double.parse(value2.value.text);
                      var result;
                      if (_buttonText == '더하기') {
                        result = value1Int + value2Int;
                      } else if (_buttonText == '빼기') {
                        result = value1Int - value2Int;
                      } else if (_buttonText == '곱하기') {
                        result = value1Int * value2Int;
                      } else if (_buttonText == '나누기') {
                        result = value1Int / value2Int;
                      }
                      sum = '$result';
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: DropdownButton(
                items: _dropDownMenuItems,
                onChanged: (String? value) {
                  setState(() {
                    _buttonText = value;
                  });
                },
                value: _buttonText,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
