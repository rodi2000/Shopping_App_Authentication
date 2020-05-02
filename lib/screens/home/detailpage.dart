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
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    mobile.url,
                    loadingBuilder: (context, child, progress) {
                      return progress == null ? child : LinearProgressIndicator();
                    },
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }
}
