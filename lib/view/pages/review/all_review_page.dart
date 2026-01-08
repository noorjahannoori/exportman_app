import 'package:exportman/theme/colors.dart';
import 'package:exportman/view/pages/review/reusable_review_widget.dart';
import 'package:exportman/view/pages/review/review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllReviewsPage extends ConsumerWidget {
  const AllReviewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewProvider);
    final theme = Theme.of(context).textTheme;

    return Scaffold(
       backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All review',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewItem(review: reviews[index]);
        },
      ),
    );
  }
}
