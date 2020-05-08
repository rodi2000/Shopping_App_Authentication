import 'package:flutter/material.dart';
import 'package:printshoppy/screens/home/home.dart';

class DetailPage extends StatelessWidget {

  final Mobile mobile;

  DetailPage(this.mobile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mobile.name, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(mobile.url),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text('Specifications', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            Container(
              height: 340,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  createListTile('Name', mobile.name),
                  createListTile('Company Name',mobile.companyName),
                  createListTile('Operating System',mobile.operatingSystem),
                  createListTile('Battery',mobile.battery),
                  createListTile('Screen Size',mobile.screenSize),
                  createListTile('Front Camera',mobile.frontCamera),
                  createListTile('Back Camera',mobile.backCamera),
                  createListTile('Ram',mobile.ram),
                  createListTile('Rom',mobile.rom),
                  createListTile('Processor',mobile.processor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget createListTile (String description, String value) {
  return Column(
    children: <Widget>[
      ListTile(
        dense: true,
        title: Text('$description : $value',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
        ),
      ),
      Divider(color: Colors.black),
    ],
  );
}