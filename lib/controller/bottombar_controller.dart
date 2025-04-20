import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/View/category_screen.dart';
import 'package:interview_task/View/curate_screen.dart';
import 'package:interview_task/View/home_screen.dart';
import 'package:interview_task/View/more_screen.dart';
import 'package:interview_task/View/sale_screen.dart';

class BottomBarController extends GetxController {
  RxInt currentIndex = 0.obs;
  var pageController = PageController().obs;
  final List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CurateScreen(),
    SaleScreen(),
    MoreScreen(),
  ].obs;

  changePage(int index) {
    currentIndex.value = index;
    pageController.value.jumpToPage(index);
  }
}
