import 'package:aid/src/screens/Login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "AID",
      theme: ThemeData(
        accentColor: Colors.orange,

      ),home: LoginScreen(),
    );

  }}