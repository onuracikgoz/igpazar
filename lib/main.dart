import 'package:flutter/material.dart';
import 'package:igpazar/views/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Bebas",
        
        textTheme: TextTheme(
            bodyText1: TextStyle(fontFamily: 'bebas', color: Colors.white)),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
