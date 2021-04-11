
import 'package:flutter/widgets.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class Authentication with ChangeNotifier
{

  Future<void> register(String name,String surname, String address, String contact, String email, String password) async
  {
    //const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyDxhRjWetZ9n8Ujln6BlKj6zkeF5GWnUas';
    //var url = Uri.parse("https://AIzaSyDxhRjWetZ9n8Ujln6BlKj6zkeF5GWnUas");
    var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDxhRjWetZ9n8Ujln6BlKj6zkeF5GWnUas');


    final response = await http.post(url, body: json.encode(
      {
        'Name' : name,
        'Surname' : surname,
        'Address' : address,
        'Contact' : contact,
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));
    final responseData = json.decode(response.body);
    print(responseData);
  }
}