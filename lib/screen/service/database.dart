import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(String name,bool manage,
String storename,
String desc,
String time ,
String lat ,
String lng) async {
    if(manage==false){
    return await userCollection.document(uid).setData({
      'acc':{
      'name': name,
      'manage': manage
      }

    });

    }
    else{
      return await userCollection.document(uid).setData({
      'acc':{
      'name': name,
      'manage': manage
      },
      'store':{
        'storename':storename,
        'desc': desc,
        'time':{
          'open': time,
          'close': time
        },
        'location':{
          'lat':0,
          'lng':0
        }
      }

    });

    }
  }

}