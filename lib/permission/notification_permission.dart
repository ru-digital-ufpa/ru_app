import 'package:permission_handler/permission_handler.dart';

class RuNotificationsPermissions {
  Future<bool> notificationPermission() async {
    bool result = false;
    //To verifier se user have permit notifications
    PermissionStatus permissionStatus0 = await Permission.notification.status;
    if (permissionStatus0 != PermissionStatus.granted) {
      PermissionStatus permissionStatus =
          await Permission.notification.request();
      // print(permissionStatus);

      permissionStatus0 = permissionStatus;
    } else if (permissionStatus0 == PermissionStatus.denied) {
      result = false;
    } else {
      result = true;
    }
    return Future.value(result);
  }
}
