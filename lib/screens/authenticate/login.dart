import 'package:flutter/material.dart';
import 'package:printshoppy/screens/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:printshoppy/services/auth.dart';

class Login extends StatefulWidget {

//  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

              SizedBox(
                height: 10.0,
              ),
              TextFormField(
//                onChanged: (value){
//                  setState(() => email = value);
//                  email = value;
//                },
                decoration: kTextFieldFormDecoration.copyWith( hintText: 'E-mail *', labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => (!EmailValidator.validate(value)) ? "Please Enter a Valid E-Mail" : null,
                onSaved: (value) => email = value,
              ),

              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                onChanged: (value){
                  setState(() => password = value);
                },
                decoration: kTextFieldFormDecoration.copyWith(hintText: 'Password *', labelText: 'Password'),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => (value.length < 6) ? "Please Enter a Valid Password" : null,
                onSaved: (value) => password = value,
              ),

              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      //Implement registration functionality.
                    if(_key.currentState.validate()){
                        _key.currentState.save();
                        dynamic result = await _auth.loginWithEmailAndPassword(email, password);
                        if(result == null){
                          print('Error Signing in');
                        }
//                        Navigator.pop(context);
                      }
                      print(email);
                      print(password);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log in',
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
    );
  }
}