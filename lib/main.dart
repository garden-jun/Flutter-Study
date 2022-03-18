import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var switchValue = false;
  String test = 'hello'; // 버튼에 들어갈 텍스트 입력

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text('$test'),
                  onPressed: () {
                    if (test == 'hello') {
                      setState(() {
                        test = 'flutter';
                      });
                    } else {
                      setState(() {
                        test = 'hello';
                      });
                    }
                  })),
        ));
  }
}
