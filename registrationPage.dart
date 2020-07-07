import 'package:bookshelf/firstPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firstPage.dart';

class RegistrationPage extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;

  String fullName;
  String contactNo;
  String eMail;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 100.0, left: 20.0, right: 20.0, bottom: 140.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Registration',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 50.0,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.face),
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        fullName = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Contact No',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        contactNo = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      labelText: 'E-Mail',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        eMail = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 120.0),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.only(left: 0.0, right: 0.0),
                    child: RaisedButton(
                      onPressed: () async {
                        try {
                          final newUser = _auth.createUserWithEmailAndPassword(
                              email: eMail, password: password);
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookApp()),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                        ),
                        height: 56.0,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
