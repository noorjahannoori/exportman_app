import 'package:flutter/material.dart';

import 'onboarding_dots.dart';

import 'package:exportman/theme/colors.dart';


class HomeImageSlider extends StatefulWidget {
  final List<String> images;

  const HomeImageSlider({super.key, required this.images});

  @override
  State<HomeImageSlider> createState() => _HomeImageSliderState();
}

class _HomeImageSliderState extends State<HomeImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          /// 🔹 IMAGE SLIDER
          PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => currentIndex = i),
            itemBuilder: (_, i) {
              return Image.asset(
                widget.images[i],
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),

          /// 🔔 NOTIFICATION ICON (TOP RIGHT)
          Positioned(
            top: 38,
            right: 20,
            child: Container(
              width: 36,
              height: 36,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.notifications_none_outlined,
                size: 18,
                color: AppColors.primary,
              ),
            ),
          ),

          /// 🔹 DOTS (BOTTOM UP)
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: OnboardingDots(
                count: widget.images.length,
                index: currentIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
