import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:interview_task/Model/mainstickymodel.dart';
import 'package:interview_task/model/rangepatternmodel.dart';
import 'package:interview_task/model/shopcategorymodel.dart';
import 'package:interview_task/services/rest_service.dart';

class HomeController extends GetxController {
  var menulist = <MainStickyMenu>[].obs;
  var shopcateegoryList = <ShopByCategory>[].obs;
  var shopfabricList = <ShopByFabric>[].obs;
  var unstitchedList = <Unstitched>[].obs;
  var boutiquecollectionList = <BoutiqueCollection>[].obs;

  var rangeOfpatternList = <RangeOfPattern>[].obs;
  var designoccasionList = <DesignOccasion>[].obs;
  var selectedIndex = 0.obs;
  var currentpageindex = 0.obs;

  final PageController pagecontroller = PageController(viewportFraction: 1);

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    mainStickyMenu();
    middleshop();
    bottomshop();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> mainStickyMenu() async {
    try {
      var result = await RestService().mainstickymenuService();
      if (result.status?.isNotEmpty ?? false) {
        menulist.value = result.mainStickyMenu;
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> middleshop() async {
    try {
      var result = await RestService().shopbycategory();
      if (result.status?.isNotEmpty ?? false) {
        shopcateegoryList.value = result.shopByCategory;
        shopfabricList.value = result.shopByFabric;
        unstitchedList.value = result.unstitched;
        boutiquecollectionList.value = result.boutiqueCollection;
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> bottomshop() async {
    try {
      var result = await RestService().patternDesign();
      if (result.status?.isNotEmpty ?? false) {
        rangeOfpatternList.value = result.rangeOfPattern;
        designoccasionList.value = result.designOccasion;
      }
    } catch (e) {
      e.toString();
    }
  }
}
