import 'package:get/get.dart';
import 'package:interview_task/model/categorymodel.dart';
import 'package:interview_task/model/shopcategorymodel.dart';
import 'package:interview_task/services/rest_service.dart';

class CategoryScreenController extends GetxController {
  var shopfabricList = <ShopByFabric>[].obs;
  var shopcateegoryList = <ShopByCategory>[].obs;
  var apicateegoryList = <Categories>[].obs;

  @override
  void onInit() {
    middleshop();
    categoryapis();
    super.onInit();
  }

  Future<void> middleshop() async {
    try {
      var result = await RestService().shopbycategory();
      if (result.status?.isNotEmpty ?? false) {
        shopcateegoryList.value = result.shopByCategory;
        shopfabricList.value = result.shopByFabric;
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> categoryapis() async {
    try {
      var result = await RestService().categoryapi();
      if (result.status?.isNotEmpty ?? false) {
        apicateegoryList.value = result.categories;
      }
    } catch (e) {
      e.toString();
    }
  }
}
