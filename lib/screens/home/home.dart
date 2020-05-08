import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:printshoppy/screens/home/detailpage.dart';
import 'dart:convert';
import 'package:printshoppy/screens/shared/loading.dart';
import 'package:printshoppy/screens/authenticate/wrapper.dart';
import 'package:printshoppy/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  Future<List<Mobile>> getMobiles() async {
    var data = await http.get('https://www.androidtutorialpoint.com/api/MobileJSONArray.json');
    var jsonData = json.decode(data.body);

    List<Mobile> mobiles = [];
    for(var i in jsonData){
      Mobile mobile = Mobile(i['rom'], i['screenSize'], i['backCamera'], i['companyName'], i['name'],
          i['frontCamera'], i['battery'], i['operatingSystem'], i['processor'], i['url'], i['ram']);
      mobiles.add(mobile);
    }
    return mobiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.exit_to_app),
            label: Text('Log out'),
            onPressed: () async {
              await _auth.logout();
              Wrapper();
            },
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: getMobiles(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Loading();
            }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 7.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(snapshot.data[index].name[0]),
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].operatingSystem),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Route route = MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]));
                        Navigator.push(context, route);
                      },
                    ),

                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Mobile {
  final String rom, screenSize, backCamera, companyName, name, frontCamera, battery, operatingSystem, processor, url, ram;

  Mobile(this.rom, this.screenSize, this.backCamera, this.companyName,
      this.name, this.frontCamera, this.battery, this.operatingSystem,
      this.processor, this.url, this.ram);

}
