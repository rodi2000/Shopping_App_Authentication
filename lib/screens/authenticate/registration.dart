import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:printshoppy/models/user.dart';
import 'package:printshoppy/screens/constants.dart';
import 'package:printshoppy/services/auth.dart';

class Registration extends StatefulWidget {

  static const String id = 'registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController cpass = TextEditingController();
  final AuthService _auth = AuthService();
  User data = User();

  String fname;
  String lname;
  String email;
  String password;
  var number;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldFormDecoration.copyWith(hintText:'First Name *',labelText: 'First Name'),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(20),
                      WhitelistingTextInputFormatter(RegExp("[a-zA-z]"))
                    ],
                    validator: (value) => (value.length < 2) ? "First Name is Not Long Enough" : null,
                    onSaved: (value) => fname = value,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldFormDecoration.copyWith(hintText: 'Last Name *',labelText: 'Last Name'),

                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(20),
                      WhitelistingTextInputFormatter(RegExp("[a-zA-z]"))
                    ],
                    validator: (value) => (value.length < 2) ? "Last Name is Not Long Enough" : null,
                    onSaved: (value) => lname = value,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldFormDecoration.copyWith(hintText: 'Mobile No. *',labelText:'Mobile No.'),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(10),
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.phone,
                    validator: (value) => (value.length < 10) ? "Mobile No. is Not Long Enough" : null,
                    onSaved: (value) => number = value,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldFormDecoration.copyWith( hintText: 'E-mail *',labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => (!EmailValidator.validate(value)) ? "Please Enter a Valid E-Mail" : null,
                    onSaved: (value) => email = value,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldFormDecoration.copyWith(hintText: 'Password *',labelText: 'Password'),
                    controller: pass,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => (value.length < 6) ? "Please Enter a Valid Password" : null,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldFormDecoration.copyWith(hintText: 'Confirm Password *',labelText: 'Confirm Password'),

                    controller: cpass,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => (value != pass.text) ? "Password Does Not Match" : null,
                    onSaved: (value) => password = value,
                  ),


                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {

                          //Implement registration functionality.
                          if(_key.currentState.validate()){
                            _key.currentState.save();
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
//                            Navigator.pop(context);
                          }
                          print(fname);
                          print(lname);
                          print(number);
                          print(email);
                          print(password);
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
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