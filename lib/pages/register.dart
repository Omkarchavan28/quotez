import 'package:flutter/material.dart';
import 'package:quotez/shared/shared.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

//text feild state

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                'Quotez',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF34495E),
                  fontSize: 40.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: Colors.white,
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    //go Sign in
                    widget.toggleView();
                  },
                  label: Text(
                    'Sign In',
                    style: TextStyle(color: Color(0xFF34495E)),
                  ),
                  icon: Icon(Icons.people, color: Color(0xFF34495E)),
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xFF34495E),
                        fontSize: 40.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Email',
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: Color(0xFF34495E),
                        ),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter Email' : null,
                      onChanged: (val) {
                        //function
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xFF34495E),
                        ),
                      ),
                      validator: (val) =>
                          val.length < 6 ? 'Enter pass more han 6 chars' : null,
                      obscureText: true,
                      onChanged: (val) {
                        //function
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      // onPressed: () async {
                      // if (_formKey.currentState.validate()) {
                      //   setState(() => loading = true);
                      //   dynamic result = await _auth
                      //       .registerWithEmailAndPassword(email, password);
                      //   if (result == null) {
                      //     setState(() {
                      //       error = 'please supply a valid email';
                      //       loading = false;
                      //     });
                      //   }
                      // }
                      // },
                      color: Color(0xFF34495E),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
