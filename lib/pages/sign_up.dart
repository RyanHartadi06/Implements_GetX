import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan_slicing/controller/login_controller.dart';
import 'package:latihan_slicing/controller/register_controller.dart';
import 'package:latihan_slicing/theme.dart';

class SignUp extends StatelessWidget {
  final _controller = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 106, 30, 70),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome \n Please sign up now",
                      style: boldTextStyle.copyWith(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                        controller: _controller.nameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Input Username',
                          prefixIcon: const Icon(
                            Icons.face_unlock_outlined,
                          ),
                          hintStyle: greyTextStyle,
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                        controller: _controller.emailController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Input Email',
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                          hintStyle: greyTextStyle,
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                        controller: _controller.passwordController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Input Password',
                          prefixIcon: Icon(
                            Icons.vpn_key,
                          ),
                          hintStyle: greyTextStyle,
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                        controller: _controller.teleponController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Telepon',
                          prefixIcon: Icon(
                            Icons.call,
                          ),
                          hintStyle: greyTextStyle,
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                        controller: _controller.alamatController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Alamat',
                          prefixIcon: Icon(
                            Icons.home,
                          ),
                          hintStyle: greyTextStyle,
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 200,
                          color: greyColor,
                          child: Stack(
                            children: [
                              Obx(() {
                                if (_controller.profilepicture.value.path ==
                                    'null') {
                                  return const Center(
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  );
                                }

                                return SizedBox(
                                  width: double.infinity,
                                  child: Image.file(
                                    _controller.profilepicture.value,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: ElevatedButton(
                                    onPressed: () => Get.bottomSheet(
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              Get.back();
                                              _controller.pickImage(
                                                  ImageSource.gallery);
                                            },
                                            title: const Text(
                                              'Ambil dari galeri',
                                              style: TextStyle(
                                                  fontFamily: 'poppins'),
                                            ),
                                            leading: const Icon(Icons.image),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Get.back();
                                              _controller.pickImage(
                                                  ImageSource.camera);
                                            },
                                            title: const Text(
                                              'Ambil dari kamera',
                                              style: TextStyle(
                                                  fontFamily: 'poppins'),
                                            ),
                                            leading:
                                                const Icon(Icons.camera_alt),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      'Pilih foto KTP',
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password?",
                          style: blackTextStyle.copyWith(fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 64,
                      width: 354,
                      child: RaisedButton(
                        onPressed: () {
                          _controller.postRegister();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: primaryColor,
                        child: Align(
                          child: Text(
                            "Sign Up",
                            style: whiteNormalTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 110,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Already have an account? Sign In",
                            style: blackTextStyle.copyWith(fontSize: 16)),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    ));
  }
}
