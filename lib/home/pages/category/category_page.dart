import 'package:exportman/home/pages/category/catergery_Detail_page.dart';
import 'package:exportman/home/pages/home/provider_home_page.dart';
import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    final categories = ref.watch(homeProvider).categories;

    return Scaffold(
      backgroundColor: AppColors.white,
      /// 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
           color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Category',
          style: theme.bodyLarge?.copyWith(color: AppColors.white),
        ),
      ),

      /// 🔹 BODY
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 157 / 174, 
          ),
          itemBuilder: (context, index) {
            final item = categories[index];

            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailPage(
                      title: item.title,
                      image: item.image,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    /// IMAGE
                    Container(
                      height: 115,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.bg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(item.image, height: 45),
                    ),

                    /// TITLE
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: theme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
