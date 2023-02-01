import 'package:permission_handler/permission_handler.dart';

class RuNotificationsPermissions {
  Future<bool> notificationPermission() async {
    bool result = false;
    //To verifier se user have permit notifications
    PermissionStatus _permissionStatus = await Permission.notification.status;
    if (_permissionStatus != PermissionStatus.granted) {
      PermissionStatus permissionStatus =
          await Permission.notification.request();
      // print(permissionStatus);

      _permissionStatus = permissionStatus;
    } else if (_permissionStatus == PermissionStatus.denied) {
      result = false;
    } else {
      result = true;
    }
    return Future.value(result);
  }
}
