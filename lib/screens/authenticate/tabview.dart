import 'package:flutter/material.dart';
import 'package:printshoppy/screens/authenticate/login.dart';
import 'package:printshoppy/screens/authenticate/registration.dart';

class Tabview extends StatefulWidget {

  @override
  _TabviewState createState() => _TabviewState();
}

class _TabviewState extends State<Tabview> with SingleTickerProviderStateMixin {

  String email;
  String password;

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
//          centerTitle: true,
          title: Image.asset('images/printshoppy_logo.png'),
          titleSpacing: 0.0,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5.0,
            controller: controller,
            tabs: <Tab>[
              Tab(text: 'Log in',),
              Tab(text: 'Register',)
            ],
          ),
        ),
        body: TabBarView(

          controller: controller,
          children: <Widget>[
            Login(),
            Registration(),
          ],
        )
    );
  }
}