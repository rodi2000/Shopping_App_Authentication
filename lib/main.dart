import 'package:flutter/material.dart';
import 'package:printshoppy/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:printshoppy/services/auth.dart';
import 'package:printshoppy/models/user.dart';
import 'package:printshoppy/screens/wrapper.dart';
import 'package:printshoppy/screens/authenticate/login.dart';
import 'package:printshoppy/screens/authenticate/registration.dart';
import 'package:printshoppy/screens/authenticate/authenticate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,    //Instance of Stream<User> from services/auth.dart
      child: MaterialApp(
//        routes: {
//          Authenticate.id: (context)=>Authenticate(),
//          Login.id: (context) => Login(),
//          Registration.id: (context) => Registration(),
//        },
        home: Wrapper(),
      ),
    );
  }
}