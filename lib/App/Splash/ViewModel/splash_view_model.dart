import 'dart:async';
import 'package:assignment/App/Home/View/homepage.dart';
import 'package:get/get.dart';

import '../../../RoutesAndBindings/app_routes.dart';
import '../View/splash.dart';

class SplashViewModel extends GetxController {
  final Duration initialDelay = const Duration(seconds: 1);

  @override
  void onInit() {
    Timer(
        const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.homeView));

    super.onInit();
  }
}
