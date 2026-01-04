import 'package:exportman/Model/home_page_model/service_model.dart';
import 'package:exportman/home/pages/home/provider_home_page.dart';
import 'package:exportman/seviceproviderdetailpages/servicepage.dart';
import 'package:exportman/widgets/onboarding_dots.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/colors.dart';

class FeatureSection extends ConsumerStatefulWidget {
  const FeatureSection({super.key});

  @override
  ConsumerState<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends ConsumerState<FeatureSection> {
  int sliderIndex = 0;

  final List<String> sliderImages = [
    'assets/images/bg.png',
    'assets/images/service.png',
    'assets/images/bg.png',
    'assets/images/service.png',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final services = ref.watch(homeProvider).services;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white, Color.fromRGBO(255, 255, 255, 0)],
              stops: [-0.0612, 0.7522],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 179,
                child: PageView.builder(
                  itemCount: sliderImages.length,
                  onPageChanged: (i) => setState(() => sliderIndex = i),
                  itemBuilder: (_, i) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        sliderImages[i],
                        width: 335,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Center(
                child: OnboardingDots(
                  count: sliderImages.length,
                  index: sliderIndex,
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature', style: theme.titleLarge),
                    Text('View All', style: theme.titleSmall),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// FEATURE CARDS
              SizedBox(
                height: 233,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return _FeatureCard(item: services[index]);
                  },
                ),
              ),
            ],
          ),
        ),

        /// ================= FIXED BOTTOM CONTAINER =================
        Container(
          width: double.infinity,
          height: 216.33,
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          color: AppColors.main,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// IMAGE CENTER
              Image.asset(
                'assets/images/Stars.png',
                height: 80,
                fit: BoxFit.contain,
              ),

              /// TEXT
              Text(
                'Introducing Customer Rating',
                textAlign: TextAlign.center,
                style: theme.bodyMedium?.copyWith(color: Colors.white),
              ),

              /// BUTTON
              SizedBox(
                width: 139,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'See Your Rating',
                    style: theme.bodyMedium?.copyWith(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final ServiceModel item;

  const _FeatureCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ServiceDetailPage(service: item)),
        );
      },
      child: Container(
        width: 157,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            /// IMAGE
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    item.image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(170),
                    ),
                    child: Text(
                      item.category.toUpperCase(),
                      style: theme.labelSmall?.copyWith(color: AppColors.main),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -10,
                  right: 12,
                  child: Container(
                    height: 22,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.heading,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: Text(
                      item.price,
                      style: theme.bodySmall?.copyWith(
                        color: AppColors.white,
                        fontSize: 12, 
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// TEXT AREA
            Container(
              height: 123,
              padding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
              decoration: const BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleMedium,
                  ),

                  const SizedBox(height: 6),

                  /// RATING
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (i) => const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(item.rating.toString(), style: theme.titleMedium),
                    ],
                  ),

                  const Spacer(),

                  /// PROVIDER
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(item.providerImage),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.providerName,
                          style: theme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
