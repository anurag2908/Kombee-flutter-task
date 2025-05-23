import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interview_task/controller/bottombar_controller.dart';
import 'package:interview_task/controller/category_controller.dart';
import 'package:interview_task/controller/home_controller.dart';
import 'package:interview_task/view/bottombar_tab.dart';

void main() {
  initController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grocery',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: BottomTabBar(),
        );
      },
    );
  }
}

initController() {
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => CategoryScreenController());
  Get.lazyPut(() => BottomBarController());
}
