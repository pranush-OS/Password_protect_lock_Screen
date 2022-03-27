import 'package:flutter/material.dart';
import 'package:flutter_firebase/try/lockScreen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pranush personals',
      theme: ThemeData.dark().copyWith(),
      home: defaultscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class defaultscreen extends StatelessWidget {
  const defaultscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password_flutter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: LockScreen(),
    );
  }
}
