import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends ChangeNotifier {
  List<XFile?> images = [];

  Future setNewImages(List<XFile>? newImages) async {
    if(newImages != null && newImages.isNotEmpty){
      images.clear();
      newImages.forEach((xfile) async {
        images.add((await xfile.readAsBytes()) as XFile?);
      });
      notifyListeners();
    }
  }
  void removeImage(int index){
    if(images.length >= index) {
      images.removeAt(index);
    }
    notifyListeners();
  }
  List<XFile?> get _images => images;
}