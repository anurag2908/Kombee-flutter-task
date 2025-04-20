import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:interview_task/Model/mainstickymodel.dart';
import 'package:interview_task/model/categorymodel.dart';
import 'package:interview_task/model/rangepatternmodel.dart';
import 'package:interview_task/model/shopcategorymodel.dart';
import 'package:interview_task/services/service_configuration.dart';

class RestService {
  static Future<http.Response> getData({required String url}) async {
    return await http.get(
      Uri.parse(ServiceConfiguration.baseUrl + url),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<MainStickyModel> mainstickymenuService() async {
    MainStickyModel result = MainStickyModel();
    try {
      final response = await getData(url: ServiceConfiguration.toprepository);
      if (response.statusCode == 200) {
        result = MainStickyModel.fromJson(json.decode(response.body));
      } else {
        result.message = ServiceConfiguration.commonErrorMessage;
      }
      return result;
    } catch (e) {
      result.message = ServiceConfiguration.commonErrorMessage;
      return result;
    }
  }

  Future<ShopCategorymodel> shopbycategory() async {
    ShopCategorymodel result = ShopCategorymodel();
    try {
      final response =
          await getData(url: ServiceConfiguration.middlerepository);
      if (response.statusCode == 200) {
        result = ShopCategorymodel.fromJson(json.decode(response.body));
      } else {
        result.message = ServiceConfiguration.commonErrorMessage;
      }
      return result;
    } catch (e) {
      result.message = ServiceConfiguration.commonErrorMessage;
      return result;
    }
  }

  Future<RangePatternModel> patternDesign() async {
    RangePatternModel result = RangePatternModel();
    try {
      final response =
          await getData(url: ServiceConfiguration.bottomrepository);
      if (response.statusCode == 200) {
        result = RangePatternModel.fromJson(json.decode(response.body));
      } else {
        result.message = ServiceConfiguration.commonErrorMessage;
      }
      return result;
    } catch (e) {
      result.message = ServiceConfiguration.commonErrorMessage;
      return result;
    }
  }

  Future<Categorymodel> categoryapi() async {
    Categorymodel result = Categorymodel();
    try {
      final response =
          await getData(url: ServiceConfiguration.categoryrepository);
      if (response.statusCode == 200) {
        result = Categorymodel.fromJson(json.decode(response.body));
      } else {
        result.message = ServiceConfiguration.commonErrorMessage;
      }
      return result;
    } catch (e) {
      result.message = ServiceConfiguration.commonErrorMessage;
      return result;
    }
  }
}
