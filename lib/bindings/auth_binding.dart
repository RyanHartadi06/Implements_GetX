import 'package:get/get.dart';
import 'package:latihan_slicing/controller/login_controller.dart';
import 'package:latihan_slicing/controller/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
