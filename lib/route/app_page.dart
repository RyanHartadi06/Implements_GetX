import 'package:get/get.dart';
import 'package:latihan_slicing/bindings/auth_binding.dart';
import 'package:latihan_slicing/bindings/job_binding.dart';
import 'package:latihan_slicing/bindings/register_binding.dart';
import 'package:latihan_slicing/pages/login.dart';
import 'package:latihan_slicing/pages/main_page.dart';
import 'package:latihan_slicing/pages/sign_up.dart';
import 'package:latihan_slicing/pages/splash_page.dart';

class AppPage {
  static final pages = [
    GetPage(name: '/', page: () => SplashPage()),
    GetPage(name: '/login', page: () => Login(), binding: AuthBinding()),
    GetPage(
        name: '/register', page: () => SignUp(), binding: RegisterBinding()),
    GetPage(name: '/main_page', page: () => MainPage(), binding: JobBinding()),
  ];
}
