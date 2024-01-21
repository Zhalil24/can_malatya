import 'package:app_settings/app_settings.dart';
import 'package:image_picker/image_picker.dart';

import 'permisson_check.dart';
import 'pick_image_custom.dart';

abstract class IPickManager {
  final IPermissionCheck permissionCheck = ApplicationPermissionCheck();
  final IpickImage pickImageCustom = PickImageCustom();

  Future<PickImageModel> fetchMediaImage();
}

class PickManager extends IPickManager {
  @override
  Future<PickImageModel> fetchMediaImage() async {
    if (!await permissionCheck.checkMediaLibraray()) {
      await AppSettings.openAppSettings();
      return PickImageModel(null);
    }
    final model = await pickImageCustom.pickImage();
    return PickImageModel(model, status: true);
  }
}

class PickImageModel {
  final XFile? file;
  final bool status;

  PickImageModel(this.file, {this.status = false});
}
