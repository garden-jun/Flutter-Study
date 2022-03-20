import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  const ImageWidgetApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('image/flutter_logo.png',
                  width: 200, height: 100, fit: BoxFit.fill),
              const Text(
                'Hello Flutter',
                style: TextStyle(
                    fontFamily: "Pacifico", fontSize: 30, color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
