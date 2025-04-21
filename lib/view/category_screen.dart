import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/component/left_curve_clipper.dart';
import 'package:interview_task/component/right_curve_clipper_widget.dart';
import 'package:interview_task/configuration/configuration.dart';
import 'package:interview_task/controller/category_controller.dart';

class CategoryScreen extends GetView<CategoryScreenController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actionsPadding: EdgeInsets.all(15),
        leading: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
        title: Text(
          "Category",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 25,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_bag_outlined, size: 25),
              Positioned(
                top: -5,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xff696e73),
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.shopcateegoryList.length,
                itemBuilder: (context, index) {
                  final data = controller.shopcateegoryList[index];
                  return Container(
                    color: getColorFromHex(data.tintColor ?? ""),
                    margin: EdgeInsets.only(bottom: 3),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: SizedBox(
                        height: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipPath(
                                clipper: LeftCurveClipper(),
                                child: Container(
                                  color: getColorFromHex(data.tintColor ?? ""),
                                  child: Center(
                                    child: Text(
                                      data.name ?? "",
                                      style: const TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // RIGHT IMAGE WITH OPPOSITE CURVE
                            Expanded(
                              child: ClipPath(
                                clipper: RightCurveClipper(),
                                child: Container(
                                  height: 150,
                                  child: Image.network(
                                    data.image ?? "", // Replace with your image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
