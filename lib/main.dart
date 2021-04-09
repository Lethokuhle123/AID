import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'dart:async';
import 'dart:core';

import 'home_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'models/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          RegistrationScreen.routeName: (ctx)=> RegistrationScreen(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),
          HomeScreen.routeName: (ctx)=> HomeScreen(),
        },
      ),
    );
  }
  
}