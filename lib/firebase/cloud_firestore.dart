import 'package:apni_dukan/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

fireStoreCreateUser() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(globalUser?.emailAddress)
      .set({
        'firstName': globalUser?.firstName,
        'lastName': globalUser?.lastName,
        'emailAddress': globalUser?.emailAddress,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

fireStoreReadUser(){
  FirebaseFirestore.instance
      .collection('users')
      .doc(globalUser?.emailAddress)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
        
    if (documentSnapshot.exists) {
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      globalUser?.setAllParameters(
        firstName: data['firstName'],
        lastName: data['lastName'],
        emailAddress: data['emailAddress'],
      );
      print('Document data: ${data['firstName']}');
    } else {
      print('Document does not exist on the database');
    }
  });
}