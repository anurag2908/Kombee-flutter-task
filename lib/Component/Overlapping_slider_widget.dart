import 'package:flutter/material.dart';
import 'package:interview_task/model/shopcategorymodel.dart';

class OverlappingSlider extends StatefulWidget {
  final List<Unstitched>? unstitchedList;

  const OverlappingSlider({super.key, this.unstitchedList = const []});

  @override
  State<OverlappingSlider> createState() => _OverlappingSliderState();
}

class _OverlappingSliderState extends State<OverlappingSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.75,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        height: 420,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.unstitchedList?.length ?? 0,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double pageOffset = 0.0;
                try {
                  pageOffset = _pageController.page ??
                      _pageController.initialPage.toDouble();
                } catch (_) {}

                double diff = pageOffset - index;
                double scale = 1 - (diff.abs() * 0.1);
                double translation = 40 * diff;

                return Transform.translate(
                  offset: Offset(translation, 0),
                  child: Transform.scale(
                    scale: scale.clamp(0.9, 1.0),
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.unstitchedList?[index].image ?? ""),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.unstitchedList?[index].description ??
                                        "",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.unstitchedList?[index].name ?? "",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
