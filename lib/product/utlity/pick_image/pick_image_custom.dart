import 'package:image_picker/image_picker.dart';

abstract class IpickImage {
  Future<XFile?> pickImage();
}

class PickImageCustom implements IpickImage {
  final _picker = ImagePicker();
  @override
  Future<XFile?> pickImage() => _picker.pickImage(source: ImageSource.camera);
}
