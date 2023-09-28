import 'dart:async';
import 'package:assignment/Common/AppStrings/app_strings.dart';
import 'package:assignment/Common/Theme/colors.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/utilities.dart';
import '../ViewModel/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashVM = Get.find<SplashViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                MyColors.secColor,
                MyColors.priColor,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DelayedDisplay(
                delay: splashVM.initialDelay,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Image.asset(
                      "assets/logo/app_logo_transparent.png",
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                ),
              ),
              h20,
              DelayedDisplay(
                delay: Duration(seconds: splashVM.initialDelay.inSeconds + 1),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        AppStrings.splashText,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
