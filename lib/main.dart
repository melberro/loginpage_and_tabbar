import 'package:flutter/material.dart';
import 'package:mart_8_ornekler/home_page.dart';
import 'package:mart_8_ornekler/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // theme: ThemeData.dark(),
      // theme: ThemeData(
      //   useMaterial3: false,
      // primarySwatch: Colors.blue,
      // ),
      home: const MyLoginPage(),
    );
  }
}
