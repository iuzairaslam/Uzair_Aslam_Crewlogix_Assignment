
import 'package:assignment/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShowMessage {
  showMessage(
      String message,
      ) {
    return Get.snackbar(
      "Success",
      message,

      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyColors.priColor,

      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
  showErrorMessage(
      String message,

      ) {
    return Get.snackbar(
      "Error",
      message,

      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,

      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

}
