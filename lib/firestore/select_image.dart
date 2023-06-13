import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageNotifier extends ChangeNotifier {
  List<Uint8List> images = [];

  Future setNewImages(List<XFile>? newImages) async {
    if(newImages != null && newImages.isNotEmpty){
      images.clear();
      newImages.forEach((xfile) async {
        images.add((await xfile.readAsBytes()));
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
  List<Uint8List> get _images => images;
}