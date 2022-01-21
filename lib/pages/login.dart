import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_slicing/controller/login_controller.dart';
import 'package:latihan_slicing/theme.dart';
import 'package:latihan_slicing/widget/loading_dialog.dart';

class Login extends StatelessWidget {
  final loginC = Get.find<LoginController>();

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
                      "Welcome \n Please sign in",
                      style: boldTextStyle.copyWith(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                        controller: loginC.nameController,
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
                        controller: loginC.passwordController,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Input Password',
                          prefixIcon: const Icon(
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
                      height: 20,
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
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => LoadingDialog());
                          final response = await loginC.login();
                          Get.back();
                          if (response) {
                            Get.toNamed('/main_page');
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: primaryColor,
                        child: Align(
                          child: Text(
                            "Login Now",
                            style: whiteNormalTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "or continue with",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 64,
                      width: 354,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () {},
                          color: whiteColor,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/Icon.png'), // <-- Use 'Image.asset(...)' here
                                const SizedBox(width: 12),
                                const Text('Sign in with Google'),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 124,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/register');
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Already have an account? Sign Up",
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
