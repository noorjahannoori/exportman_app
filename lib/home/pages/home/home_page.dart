import 'package:exportman/home/pages/home/provider_home_page.dart';
import 'package:exportman/home/pages/home/widget/categery_gird.dart';
import 'package:exportman/home/pages/home/widget/feature_section.dart';
import 'package:exportman/home/pages/home/widget/home_search_bar.dart';
import 'package:exportman/home/pages/home/widget/home_slider.dart';

import 'package:exportman/home/pages/home/widget/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              HomeImageSlider(images: homeData.sliders),
              const HomeSearchBar(),
            ],
          ),

          const SizedBox(height: 50),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 20)),
          Column(
            children: [CategoryGrid(), ServiceSection(), FeatureSection()],
          ),
          // next sections yahin add hon gi
        ],
      ),
    );
  }
}
