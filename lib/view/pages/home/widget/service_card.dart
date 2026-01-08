import 'package:exportman/view/pages/home/provider_home_page.dart';
import 'package:exportman/seviceproviderdetailpages/servicepage.dart';
import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceSection extends ConsumerWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(homeProvider).services;
    final theme = Theme.of(context).textTheme;

    return Container(
      height: 420,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Services', style: theme.titleLarge),
                Text('View All', style: theme.titleSmall),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// SERVICES LIST
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final item = services[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ServiceDetailPage(service: item),
                      ),
                    );
                  },
                  child: Container(
                    width: 260,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// IMAGE + OVERLAYS
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            /// IMAGE
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                item.image,
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            /// CATEGORY (TOP LEFT)
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
                                  style: theme.labelSmall?.copyWith(color: AppColors.main)
                                ),
                              ),
                            ),

                            /// PRICE (CENTER OVER IMAGE + CARD)
                            Positioned(
                              bottom: -14,
                              left: 150,
                              right: 0,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.heading,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: AppColors.white,
                                      width: 3,
                                    ),
                                  ),
                                  child: Text(
                                    item.price,
                                    style: theme.titleMedium?.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// CONTENT
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// TITLE
                              Text(item.title, style: theme.titleMedium),

                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  /// ⭐⭐⭐⭐⭐ STARS
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 6),

                                  /// RATING TEXT
                                  Text(
                                    item.rating.toString(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              /// DESCRIPTION
                              Text(
                                item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.bodyMedium,
                              ),

                              const SizedBox(height: 12),

                              /// PROVIDER
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage: AssetImage(
                                      item.providerImage,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.providerName,
                                    style: theme.bodySmall,
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
