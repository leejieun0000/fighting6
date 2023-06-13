import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '';

class ImageStorge {
  static Future uploadImages(List<Uint8List>images) async {
    if(FirebaseAuth.instance.currentUser == null){
      return [];
    }

    String userKey = FirebaseAuth.instance.currentUser!.uid;

    var metaData = SettableMetadata(contentType: 'image/jpeg');
    List<String> downloadUrls = [];

    try {
      for(int i = 0; i< images.length; i++){
        Reference ref = FirebaseStorage.instance.ref('images/&{userKey}/$i.jpg');
        if(images.isNotEmpty){
          await ref.putData(images[i], metaData);
          downloadUrls.add(await ref.getDownloadURL());
        }
      }
    } on FirebaseException catch (e)  {
      return '-1';
    }

    return downloadUrls;
  }
}