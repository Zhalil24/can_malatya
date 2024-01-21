import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionCheck {
  Future<bool> checkMediaLibraray();
}

class ApplicationPermissionCheck implements IPermissionCheck {
  @override
  Future<bool> checkMediaLibraray() async {
    var status = await Permission.camera.status;

    return status.isGranted;
  }
}
