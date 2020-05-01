import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });


  // Collection Reference
  final CollectionReference info = Firestore.instance.collection('userinfo');

  Future updateUserData (String fname, String lname, var number) async {
    return await info.document(uid).setData({
      'fname': fname,
      'lname': lname,
      'contact': number,
    });
  }

  // Get Stream To Listening The Changes in The Database
  Stream<QuerySnapshot> get userinfo {
    return info.snapshots();
  }

}