import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final List<String> banners = [
    'assets/images/Group 484110.png',
    'assets/images/59970c0f966fb14b8625cecbbb98f4875fda4b6c.png',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    //-------------------------Banner---------------------------//

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 154,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            },
          ),
          items: banners.map((path) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: banners.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.grey.shade400,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
          ),
        ),
      ],
    );
  }
}
