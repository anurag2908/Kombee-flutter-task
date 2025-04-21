import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> alertDialog(String title, String des, {Function? ontap}) async {
  await Get.dialog(
    PopScope(
      canPop: true,
      child: AlertDialog(
        contentPadding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        title: Text(title),
        content: Text(des),
        actions: [
          GestureDetector(
            onTap: () {
              if (ontap != null) {
                ontap();
                return;
              }
              Get.back();
              Get.focusScope?.unfocus();
            },
            child: Container(
              width: 30,
              height: 30,
              color: Colors.transparent,
              child: const Center(child: Text("Ok")),
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor"; // add full opacity if alpha not provided
  }
  return Color(int.parse("0x$hexColor"));
}
