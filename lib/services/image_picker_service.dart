import 'package:image_picker/image_picker.dart';

class ImagePickerService{
   final ImagePicker _picker = ImagePicker();

  Future <List<XFile>?> pickedImage()async{
    final images = await _picker.pickMultipleMedia(imageQuality: 5);
    return images;
  }
}