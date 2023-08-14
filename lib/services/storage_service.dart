import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService{
  final storageRef = FirebaseStorage.instance.ref();
  Future<List<String>?> uploadImages(List<XFile> images)async{
    List<String> urls = [];
   for(var image in images){
final mountainImagesRef = storageRef.child('images/${DateTime.now().day}/${image.name}');
try {
  final file = File(image.path);
  final uploadTask = await mountainImagesRef.putFile(file);
  final url = await uploadTask.ref.getDownloadURL();//ssylkany tartip alabyz
  urls.add(url);
  return urls;
 }
  catch (error) {
  print(error.toString());
  
}
   } 
  }
}