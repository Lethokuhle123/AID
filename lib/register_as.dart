import 'package:flutter/material.dart';
import 'package:flutter_app_registration/registration_screen.dart';

class UserRegister extends StatefulWidget{
  static const routeName = '/registerAs';
  @override
  _UserRegisterState createState() =>  _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Register as'),
       backgroundColor: Colors.blue,
       centerTitle: true,

     ),
      body: Stack(
          children: <Widget>[
            Container(
               decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                      Colors.cyanAccent,
                      Colors.indigo,
                    ]
                )
              ),
              ),

            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 250,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            child: Text(
                                'Patient'
                            ),
                            onPressed: ()
                            {
                              Navigator.of(context).pushReplacementNamed(RegistrationScreen.routeName);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),

                            ),
                            color: Colors.blueGrey,
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            child: Text(
                                'Doctor'
                            ),
                            onPressed: ()
                            {
                              Navigator.of(context).pushReplacementNamed(RegistrationScreen.routeName);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),

                            ),
                            color: Colors.blueGrey,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]

      ),
    );
  }
}