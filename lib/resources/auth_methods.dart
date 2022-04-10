import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List? file,
  }) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        //register the user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //add user info to database
        _firestore.collection('users').doc(credential.user!.uid).set(
          {
            "username": username,
            "uid": credential.user!.uid,
            "email": email,
            "followers": [],
            "following": [],
          },
        );
      }
    } catch (err) {
      res = err.toString();
    }
    log(res);
    return res;
  }
}
