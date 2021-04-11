import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_registration/login_screen.dart';
import 'package:flutter_app_registration/models/authentication.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {
    'Name'
    'Surname'
    'Address'
    'Contact'
    'email' : '',
    'password' : ''
  };

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
    {
      return;
    }
    _formKey.currentState.save();

    await Provider.of<Authentication>(context, listen: false).register(
        _authData['Name'],
        _authData['Surname'],
        _authData['Address'],
        _authData['Contact'],
        _authData['email'],
        _authData['password']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registration'),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Login'),
                Icon(Icons.person)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
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
                height: 450,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                        //First name
                        TextFormField(
                            decoration: InputDecoration(labelText: 'First name'),
                            keyboardType: TextInputType.name,
                            onSaved: (value)
                            {
                              _authData['Name'] = value;
                            }
                        ),

                        //Last Name
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Last name'),
                            keyboardType: TextInputType.name,
                            onSaved: (value)
                            {
                              _authData['Surname'] = value;
                            }
                        ),
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Home Address'),
                            keyboardType: TextInputType.streetAddress,
                            onSaved: (value)
                            {
                              _authData['Address'] = value;
                            }
                        ),

                        //Phone number of the patient
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Contact'),
                            keyboardType: TextInputType.phone,
                            onSaved: (value)
                            {
                              _authData['Contact'] = value;
                            }
                        ),

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
                              _authData['email'] = value;
                            }
                        ),
                        // Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
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
                            _authData['password'] = value;
                          },
                        ),

                        // Confirm Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value.isEmpty || value != _passwordController.text)
                            {
                              return 'password does not match';
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
                        RaisedButton(
                          child: Text(
                              'submit'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          color: Colors.blueGrey,
                          textColor: Colors.white,
                        )
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
