import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';

class MainService extends GetxService {
  Future<void> init() async {
    if (GetPlatform.isAndroid || GetPlatform.isIOS) {
      Permission.storage.request().isGranted.then((value) {
        final LocalStorage storage = LocalStorage('tokenStorage');
        return;
      });
    } else {
      final LocalStorage storage = LocalStorage('tokenStorage');
    }
  }
}
