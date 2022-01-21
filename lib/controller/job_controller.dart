import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_slicing/global/api.dart';
import 'package:latihan_slicing/model/job_model.dart';
import 'package:latihan_slicing/services/remote_services.dart';

class JobController extends GetxController {
  RxList<JobModel> listJob = <JobModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchJob();
    super.onInit();
  }

  void fetchJob() async {
    isLoading.value = true;
    print("getting data");
    final job = await RemoteServices.fetchData();
    print(job);
    if (job != null) {
      listJob.addAll(job);
    }
    isLoading.value = false;
  }
}
