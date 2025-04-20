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
            alignment: Alignment(0, 1),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
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
                          Text(
                            data.subName ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
