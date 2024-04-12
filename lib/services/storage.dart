import "dart:io";

import "package:firebase_storage/firebase_storage.dart";
import "package:image_picker/image_picker.dart";

class StorageServices {
  Future<String> uploadImage(String path, XFile file,
      {String? fileName}) async {
    try {
      final uploadPath = "$path/${fileName != null ? fileName : file.name}";
      final ref = FirebaseStorage.instance.ref().child(uploadPath);
      await ref.putFile(File(file.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("inside uploadImage");
      print(e.toString());
      return "error";
    }
  }

  Future<String> updateImage(String url, XFile file) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(url);
      await ref.putFile(File(file.path));
      final updatedUrl = await ref.getDownloadURL();
      return updatedUrl;
    } catch (e) {
      print("inside uploadImage");
      print(e.toString());
      return "error";
    }
  }
}
