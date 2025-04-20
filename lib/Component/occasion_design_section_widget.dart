import 'package:flutter/material.dart';
import 'package:interview_task/model/rangepatternmodel.dart';

// ignore: must_be_immutable
class OccasionDesignSection extends StatelessWidget {
  List<DesignOccasion> data = [];

  OccasionDesignSection({super.key, this.data = const []});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < data.length; i += 3) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (j) {
            int index = i + j;
            if (index < data.length) {
              return buildOccasionBox(data[index]);
            } else {
              return Expanded(child: SizedBox()); // Filler for empty spots
            }
          }),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...rows,
      ],
    );
  }

  Widget buildOccasionBox(DesignOccasion data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.image ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Color(0xffe6f5fe).withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.subName ?? "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              "+EXPLORE",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
