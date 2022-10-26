import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/app/services/connectivity_service.dart';
import 'package:chomoi/app/services/local_storage_service.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static Future<void> init() async{
    /// init Service
    await Get.putAsync(() => LocalStorageService().init());
    Get.put<ConnectivityService>(ConnectivityServiceImpl());
    await Get.putAsync<AuthService>(() => AuthServiceImpl().init());
  }
}
