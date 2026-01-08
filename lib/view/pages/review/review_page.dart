import 'package:exportman/view/pages/review/all_review_page.dart';
import 'package:exportman/view/pages/review/reusable_review_widget.dart';
import 'package:exportman/view/pages/review/review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewsSection extends ConsumerWidget {
  final int previewCount; // kitne reviews show karne hain (2)

  const ReviewsSection({
    super.key,
    this.previewCount = 2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewProvider);
    final theme = Theme.of(context).textTheme;

    if (reviews.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews', style: theme.bodyMedium),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AllReviewsPage(),
                  ),
                );
              },
              child: Text('View All', style: theme.titleSmall),
            ),
          ],
        ),

        const SizedBox(height: 8),

        /// PREVIEW LIST (2 reviews)
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              reviews.length > previewCount ? previewCount : reviews.length,
          itemBuilder: (context, index) {
            return ReviewItem(review: reviews[index]);
          },
        ),
      ],
    );
  }
}
