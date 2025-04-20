import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: getColorFromHex(data.tintColor ?? ""),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data.name ?? "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(),
                              child: Image.network(
                                data.image ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
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

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.5, 0);
    path.quadraticBezierTo(
      size.width * 1.2,
      size.height / 2,
      size.width * 0.7,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ReverseCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.3, size.height);
    path.quadraticBezierTo(
      -size.width * 0.2,
      size.height / 2,
      size.width * 0.3,
      0,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
