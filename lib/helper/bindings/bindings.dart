import 'package:g_trip/veiw_model/auth-driver-veiw-model.dart';
import 'package:g_trip/veiw_model/auth_veiw_model.dart';
import 'package:g_trip/veiw_model/google_map_driver.dart';
import 'package:g_trip/veiw_model/google_veiw_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => AuthDriverVeiwModel());
    Get.lazyPut(() => GoogleVeiwDriverModel());
    Get.lazyPut(() => GoogleVeiwModel());
  }
}
