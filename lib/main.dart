import 'package:flutter/material.dart';
import 'package:phone_book/phone_book_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhoneBookScreen(),
    );
  }
}
