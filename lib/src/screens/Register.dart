import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();

}


class _RegisterScreenState extends State <RegisterScreen>{

  String _name, _surname,_userType ,_email, _pswd, _chosenValue;


  final auth = FirebaseAuth.instance;
  final firebaseDatabase = FirebaseDatabase.instance;



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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Name"),
                    onChanged: (value){
                      setState(() {
                        _name = value.trim();
                      });
                    }

                )
            ),
          ),





          Padding(
            padding: const EdgeInsets.all(20),
            child: (
                TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Surname"),
                    onChanged: (value){
                      setState(() {
                        _surname = value.trim();
                      });
                    }

                )
            ),
          ),

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


          DropdownButton<String>(
            focusColor:Colors.white,
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor:Colors.black,
            items: <String>[
              '',
              'Doctor',
              'Patient',

            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style:TextStyle(color:Colors.black),),
              );
            }).toList(),
            hint:Text(
              "User type",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
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
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.blue,
                splashColor: Colors.black12,
                onPressed: (){
                  try{
                    auth.createUserWithEmailAndPassword(email: _email, password: _pswd);
                    if(auth !=  null) {
                      try {
                        addData(_name, _email, _surname, _userType);
                      } on FirebaseDatabase catch (e1) {
                        print(e1);
                      }
                    }
                  }on FirebaseAuthException catch (e) {
                    print(e.message);
                  }

                },
                child: Text(
                    "Register"
                ),
              ),
    // ignore: deprecated_member_use
      FlatButton(
        color: Colors.blue,
        splashColor: Colors.black12,
        onPressed: (){
        },
          child: Text(
          "Login"
          ),
      ),

                // goto the login page
            ],
          )
        ],
      ),
    );
  }
  void addData(String name, String email ,String surname, String usrType){
    final User user = auth.currentUser;
    final uid = user.uid;


    firebaseDatabase.reference().child("/").set({
      "Users": {
      'name': name,
      "surname": surname,
      "email": email,
      "user type": usrType
      }
    });


  }
}
