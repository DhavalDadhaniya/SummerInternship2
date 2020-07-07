import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf/loginPage.dart';
import 'package:bookshelf/registrationPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    try {
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Icon(Icons.book, size: 300),
                  Text(
                    'book shelf',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 70.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.only(left: 0.0, right: 0.0),
                    child: RaisedButton(
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                        ),
                        height: 65.0,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 28.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.only(left: 0.0, right: 0.0),
                    child: RaisedButton(
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationPage.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                        ),
                        height: 65.0,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 28.0,
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
