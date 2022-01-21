import 'package:get/get.dart';
import 'package:latihan_slicing/controller/job_controller.dart';

class JobBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JobController());
  }
}
