import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bookshelf/registrationPage.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 140.0, left: 20.0, right: 20.0, bottom: 140.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'book shelf',
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 60.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: null,
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.only(left: 0.0, right: 0.0),
                      child: RaisedButton(
                        elevation: 10.0,
                        onPressed: null,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.black,
                          ),
                          height: 56.0,
                          child: Center(
                            child: Text(
                              'Login',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Yet not registered?'),
                        SizedBox(
                          width: 5.0,
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register Now!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 45.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              'OR',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: null,
                            child: Image(
                              image: AssetImage('images/facebook.png'),
                              height: 58.0,
                              width: 58.0,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          FlatButton(
                            onPressed: null,
                            child: Image(
                              image: AssetImage('images/google.png'),
                              height: 50.0,
                              width: 50.0,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
