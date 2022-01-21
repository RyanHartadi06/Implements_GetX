import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_slicing/services/remote_services.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  @override
  onClose() {
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<bool> login() async {
    try {
      isLoading.value = true;
      final response = await RemoteServices.login(
          nameController.text, passwordController.text);
      isLoading.value = false;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
