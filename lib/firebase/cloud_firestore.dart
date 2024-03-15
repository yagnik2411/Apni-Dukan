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
        'phoneNumber': globalUser?.phoneNumber,
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
        phoneNumber: data['phoneNumber'],

      );
      print('Document data: ${data['firstName']}');
    } else {
      print('Document does not exist on the database');
    }
  });
}

fireStoreCreateAddress() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(globalUser?.emailAddress).collection('address').doc('address')
      .set({
        'address': globalAddress?.address,
        'city': globalAddress?.city,
        'state': globalAddress?.state,
        'pinCode': globalAddress?.pinCode,
      })
      .then((value) => print("Address Added"))
      .catchError((error) => print("Failed to add adress: $error"));
}

fireStoreReadAddress() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(globalUser?.emailAddress).collection('address').doc('address')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      globalAddress?.setAllParameters(
        address: data['address'],
        city: data['city'],
        state: data['state'],
        pinCode: data['pinCode'],
      );
      print('Document data: ${data}');
    } else {
      print('Document does not exist on the database');
    }
  });
}
