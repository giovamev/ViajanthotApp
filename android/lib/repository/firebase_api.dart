import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:android/firebase_options.dart';

class FirebaseApi{

  Future<bool> registerUser(String email, String password) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e){
      print(e.code);
      return false;
    } catch (e){
      print(e);
      return false;
    }



  }
}