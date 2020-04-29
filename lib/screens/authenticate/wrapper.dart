import 'package:flutter/material.dart';
import 'package:printshoppy/models/user.dart';
import 'package:printshoppy/screens/authenticate/tabview.dart';
import 'package:provider/provider.dart';
import 'package:printshoppy/screens/home/home.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
//    print(user);
    // Return Either Home or Authenticate Widget
    if(user == null)
      return Tabview();
    else
      return Home();
  }
}
