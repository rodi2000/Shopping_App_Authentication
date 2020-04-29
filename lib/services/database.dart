import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });


  // Collection Reference
  final CollectionReference info = Firestore.instance.collection('userinfo');

  Future updateUserData (String fname, String lname, var number) async {
    return await info.document(uid);
  }

}