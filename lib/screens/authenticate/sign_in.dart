import 'package:chaiwala420/services/auth.dart';
import 'package:chaiwala420/widgets/common/hamburger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //  Text field state
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      drawer: Hamburger().buildPublicHamburger(),
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () {
                widget.toggleView();
              },
              label: Text('Register'))
        ],
        title: Text(
          "CHAIWALA 420",
          style: TextStyle(
            fontSize: 20,
            // letterSpacing: 2
          ),
        ),
        // centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text("SIGN IN",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.brown[600],
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1)),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    // textAlign: TextAlign.center,
                    validator: (val) => val.isEmpty ? "Please enter an emailId" : null,
                    maxLength: 30,
                    style: TextStyle(fontSize: 20, height: 1.5),
                    decoration: InputDecoration(hintText: "Email Id"),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? "Please enter a password" : null,
                    // textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, height: 1.5),
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      // color: Colors.brown[400],
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.brown[400],
                          primary: Colors.brown[400],
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print("Email : ${email}\nPassword : ${password}");
                        }
                      })
                ],
              ),
            ),
          )
          // RaisedButton(
          //   child: Text("Sign in"),
          //   onPressed: () async {
          //     dynamic result = await _auth.signInAnonymous();
          //     if(result == null)
          //       print("Error signing in");
          //     else {
          //       print("Signed in");
          //       print(result.uid);
          //     }
          //   },
          // ),
          ),
    );
  }
}
