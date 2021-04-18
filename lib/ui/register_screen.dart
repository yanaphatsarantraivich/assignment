import 'package:assignment/net/flutterfire.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';

import 'home.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _citizenId = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  String _errorEmail;
  String _errorPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _citizenId,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Citizen ID",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: _emailField,
                onTap: () {
                  setState(() => _errorEmail = null);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    setState(() => _errorEmail = 'Please enter Email');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorText: _errorEmail,
                  errorStyle: TextStyle(color: Colors.red, fontSize: 14.0),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _passwordField,
                onTap: () {
                  setState(() => _errorPassword = null);
                },
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    setState(() => _errorPassword = 'Please enter Password');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorText: _errorPassword,
                  errorStyle: TextStyle(color: Colors.red, fontSize: 14.0),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      String shouldNavigate = await register(_emailField.text,
                          _passwordField.text, _citizenId.text);
                      if (shouldNavigate == 'success') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      } else {
                        setState(() {
                          if (shouldNavigate == 'weak-password') {
                            _errorPassword =
                                "The password provided is too weak.";
                          } else if (shouldNavigate == 'email-already-in-use') {
                            _errorEmail = "Emailid already exist.";
                          }
                          return;
                        });
                      }
                    }
                  },
                  child: Text("Register")),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            FlatButton(
              child: Text("Back", style: TextStyle(color: Colors.white)),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Authentication(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
