import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan_slicing/services/remote_services.dart';
import 'package:latihan_slicing/widget/loading_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final teleponController = TextEditingController();
  final alamatController = TextEditingController();
  final isLoading = false.obs;

  Rx<File> profilepicture = File('null').obs;
  @override
  onClose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    teleponController.dispose();
    alamatController.dispose();
    profilepicture.value = File('null');
    super.onClose();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) {
        profilepicture.value = File('null');
        return;
      }

      File? imageTemp;

      if (source == ImageSource.camera) {
        imageTemp = await saveImagePermanently(image.path);
      } else {
        imageTemp = File(image.path);
      }

      profilepicture.value = imageTemp;
    } on PlatformException catch (e) {
      print('failed pick image: ${e.toString()}');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationSupportDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future<void> postRegister() async {
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("http://pengaduan.devliffe.com/api/register"));

      Map<String, String> headers = {"Content-type": "multipart/form-data"};

      request.headers.addAll(headers);
      request.fields.addAll({
        "nm_pelapor": nameController.text,
        "email": emailController.text,
        "telepon": teleponController.text,
        "alamat": alamatController.text,
        "password": passwordController.text,
      });

      if (profilepicture.value.path != 'null') {
        request.files.add(http.MultipartFile(
          'foto',
          profilepicture.value.readAsBytes().asStream(),
          profilepicture.value.lengthSync(),
          filename: 'profile',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      print("request: " + request.fields.toString());
      var res = await request.send();
      var response = await http.Response.fromStream(res);
      print("This is response:" + res.statusCode.toString());
      print("This is response:" + response.body);
      return;
    } catch (e) {
      return;
    }
  }

  Future<bool> isRegister() async {
    try {
      final response = await RemoteServices.doRegister(
          emailController.text,
          nameController.text,
          passwordController.text,
          teleponController.text,
          alamatController.text);
      return true;
    } catch (e) {
      return false;
    }
  }
}
