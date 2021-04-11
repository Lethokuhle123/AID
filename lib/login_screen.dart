import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_registration/register_as.dart';



class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit()
  {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          TextButton(
            child: Row(
              children: <Widget>[
                Text('Register'),
                Icon(Icons.person_add)
              ],
            ),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(UserRegister.routeName);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreenAccent,
                  Colors.blue,
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
                height: 260,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                      //Email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@'))
                              {
                                return 'invalid email';
                              }
                            return null;
                          },
                          onSaved: (value)
                            {

                            }
                        ),
                        // Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value)
                            {
                              if(value.isEmpty || value.length<=5)
                                {
                                  return 'invalid password';
                                }
                              return null;
                            },
                          onSaved: (value)
                            {

                            },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: Text(
                            'sign in as Patient'
                          ),
                          onPressed: ()
                            {
                              _submit();
                            },

                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: Text(
                              'sign in as Doctor'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
