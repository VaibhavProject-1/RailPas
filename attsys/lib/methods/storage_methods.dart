import 'package:firebase_storage/firebase_storage.dart';

import '../constants.dart';
import 'dart:typed_data';


class StorageMethods{
  Future<String> uploadImageToStorage(Uint8List file)async
  {
    Reference ref = FirebaseStorage.instance.ref().child('profile').child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask.snapshot;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> addImageToFirestore(String url)async
  {
    String res = "Some Error Occured";
    try{
      firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).update(
        {
          'photoUrl':url
        }
      );
      res = "Success";
    }
    catch (err){
      res = err.toString();
    }
    return res;
  }
}