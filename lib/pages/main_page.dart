import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_slicing/controller/job_controller.dart';
import 'package:latihan_slicing/model/job_model.dart';
import 'package:latihan_slicing/theme.dart';
import 'package:latihan_slicing/widget/job.dart';

class MainPage extends StatelessWidget {
  final jobC = Get.find<JobController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(child: Obx(() {
            if (jobC.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobC.listJob.length,
                itemBuilder: (context, i) {
                  final job = jobC.listJob[i];
                  return Job(job: job);
                },
              ),
            );
          })) // Text("Asd")
        ],
      ),
    ));
  }
}
