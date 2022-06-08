import 'package:flutter/material.dart';
import 'package:image_pick/Screen/Image_Picker.dart';
import 'package:image_pick/Screen/demo.dart';
import 'package:image_pick/Screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Demo(),
      home: Screen(),
    );
  }
}
