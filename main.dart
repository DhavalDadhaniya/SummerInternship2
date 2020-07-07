import 'package:bookshelf/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf/loginPage.dart';
import 'package:bookshelf/registrationPage.dart';
import 'package:bookshelf/homePage.dart';

void main() {
  runApp(BookShelf());
}

class BookShelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
      },
    );
  }
}
