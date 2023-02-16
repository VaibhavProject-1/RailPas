import 'package:attsys/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthMethods{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> loginUser(
    {
      required String email,
      required String password,
    })async
    {
      String result="Some error occured";
      try{
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        result="Success";
      }
    on FirebaseAuthException catch(e){
      result=e.message.toString();
    }
    return result;
  }


  Future<String> signUpUser(
    {
      required String userName,
      required String email,
      required String password,
    })async{
      String result = "Some Error Occured";
      try{
        UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword( email: email, password: password);
        UserModel userModel = UserModel(credential.user!.uid, userName.trim(), email, "", "", "", "", "", "", "");
        await firebaseFirestore.collection('users').doc(credential.user!.uid).set(userModel.toJson());
        result="Success";
      }
      on FirebaseAuthException catch(e){
        result=e.message.toString();
    }
    return result;
  

    

}}