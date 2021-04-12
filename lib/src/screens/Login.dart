import 'package:aid/src/screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

}


class _LoginScreenState extends State <LoginScreen>{

  String _email, _pswd;

  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Column(

        children: [
          Padding(
          padding: const EdgeInsets.all(20),
            child: (
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "Email"),
                  onChanged: (value){
                    setState(() {
                      _email = value.trim();
                    });
                  }

              )
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: (
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  onChanged: (value){
                    setState(() {
                      _pswd = value.trim();
                    });
                  }

                )
            ),
          ),
          Column(
            children: [
              TextButton(

                child: Text("Login"),
                onPressed: (){
                  try{
                    auth.signInWithEmailAndPassword(email: _email, password: _pswd);
                  }on FirebaseAuthException catch (e) {
                    print(e.message);
                  }

                },
              ),
              TextButton(
                child: Text("Register"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  }

              )
            ],


          )


        ],



      ),
    );
  }
}
