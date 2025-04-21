import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/Component/Overlapping_slider_widget.dart';
import 'package:interview_task/Component/category_card_widget.dart';
import 'package:interview_task/Component/material_card_widget.dart';
import 'package:interview_task/Component/occasion_design_section_widget.dart';
import 'package:interview_task/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'asset/image/fab.png',
                        height: 50,
                        width: 200,
                      ),
                      Row(
                        children: [
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
                      )
                    ],
                  ),
                ),
                // Top Menu
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.menulist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => controller.changeIndex(index),
                        child: Container(
                          width: 150,
                          height: 130,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.network(
                                  controller.menulist[index].image ?? "",
                                  width: double.infinity,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                controller.menulist[index].title ?? "",
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Slider Based on Selection
                Obx(() {
                  if (controller.menulist.isEmpty) {
                    return Center(
                        child: Text(
                      "No menu items available",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ));
                  }

                  final selectedMenu = controller.menulist[controller
                      .selectedIndex.value
                      .clamp(0, controller.menulist.length - 1)];
                  final sliderItems = selectedMenu.sliderImages;

                  if (sliderItems.isEmpty) {
                    return Center(
                        child: Text("No slider images for this menu"));
                  }

                  return CarouselSlider(
                    options: CarouselOptions(
                        height: 300,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        viewportFraction: 0.8),
                    items: sliderItems.map<Widget>((item) {
                      return Container(
                        // margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(item.image ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              item.title ?? "" + ' ' + (item.cta ?? ""),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),

                // Shop By Category
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Shop By Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        (controller.shopcateegoryList.length / 2)
                            .ceil(), // Number of columns
                        (columnIndex) {
                          int topIndex = columnIndex * 2;
                          int bottomIndex = topIndex + 1;

                          return Column(
                            spacing: 10,
                            children: [
                              if (topIndex <
                                  controller.shopcateegoryList.length)
                                SizedBox(
                                  height: 180,
                                  width: 150,
                                  child: CategoryCard(
                                    imagePath: controller
                                            .shopcateegoryList[topIndex]
                                            .image ??
                                        "",
                                    name: controller
                                            .shopcateegoryList[topIndex].name ??
                                        "",
                                    color: controller
                                            .shopcateegoryList[topIndex]
                                            .tintColor ??
                                        "",
                                  ),
                                ),
                              if (bottomIndex <
                                  controller.shopcateegoryList.length)
                                SizedBox(
                                  height: 180,
                                  width: 150,
                                  child: CategoryCard(
                                    imagePath: controller
                                            .shopcateegoryList[bottomIndex]
                                            .image ??
                                        "",
                                    name: controller
                                            .shopcateegoryList[bottomIndex]
                                            .name ??
                                        "",
                                    color: controller
                                            .shopcateegoryList[bottomIndex]
                                            .tintColor ??
                                        "",
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Shop By Fabric Material
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Shop By Fabric Material",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        (controller.shopfabricList.length / 2)
                            .ceil(), // Number of columns
                        (columnIndex) {
                          int topIndex = columnIndex * 2;
                          int bottomIndex = topIndex + 1;

                          return Column(
                            spacing: 10,
                            children: [
                              if (topIndex < controller.shopfabricList.length)
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: FabricMaterialWidget(
                                    imagePath: controller
                                            .shopfabricList[topIndex].image ??
                                        "",
                                    name: controller
                                            .shopfabricList[topIndex].name ??
                                        "",
                                  ),
                                ),
                              if (bottomIndex <
                                  controller.shopfabricList.length)
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: FabricMaterialWidget(
                                    imagePath: controller
                                            .shopfabricList[bottomIndex]
                                            .image ??
                                        "",
                                    name: controller
                                            .shopfabricList[bottomIndex].name ??
                                        "",
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Unstiched
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Unstiched",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),

                OverlappingSlider(
                  unstitchedList: controller.unstitchedList,
                ),

                // Boutique Collection
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    "Boutique Collection",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 380,
                  child: PageView.builder(
                    controller: controller.pagecontroller,
                    itemCount: controller.boutiquecollectionList.length,
                    onPageChanged: (index) {
                      controller.currentpageindex.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            controller.boutiquecollectionList[index]
                                    .bannerImage ??
                                "",
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller
                                          .boutiquecollectionList[index].name ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  controller
                                          .boutiquecollectionList[index].cta ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "+EXPLORE",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        controller.boutiquecollectionList.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: controller.currentpageindex.value == index
                              ? Colors.black
                              : Colors.black26,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),

                // Range Of Pattern
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Range Of Pattern",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        (controller.rangeOfpatternList.length / 2)
                            .ceil(), // Number of columns
                        (columnIndex) {
                          int topIndex = columnIndex * 2;
                          int bottomIndex = topIndex + 1;

                          return Column(
                            spacing: 10,
                            children: [
                              if (topIndex <
                                  controller.rangeOfpatternList.length)
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: FabricMaterialWidget(
                                    imagePath: controller
                                            .rangeOfpatternList[topIndex]
                                            .image ??
                                        "",
                                    name: controller
                                            .rangeOfpatternList[topIndex]
                                            .name ??
                                        "",
                                  ),
                                ),
                              if (bottomIndex <
                                  controller.rangeOfpatternList.length)
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: FabricMaterialWidget(
                                    imagePath: controller
                                            .rangeOfpatternList[bottomIndex]
                                            .image ??
                                        "",
                                    name: controller
                                            .rangeOfpatternList[bottomIndex]
                                            .name ??
                                        "",
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Range Of Pattern
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Design of Per Occasion",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),

                OccasionDesignSection(
                  data: controller.designoccasionList,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
