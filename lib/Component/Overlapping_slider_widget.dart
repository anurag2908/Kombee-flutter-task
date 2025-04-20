import 'package:flutter/material.dart';
import 'package:interview_task/model/shopcategorymodel.dart';

// ignore: must_be_immutable
class OverlappingSlider extends StatelessWidget {
  List<Unstitched>? unstitchedList = const [];
  OverlappingSlider({super.key, this.unstitchedList = const []});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.7),
        itemCount: unstitchedList?.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(unstitchedList?[index].image ?? ""),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        unstitchedList?[index].name ?? "",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        unstitchedList?[index].description ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
