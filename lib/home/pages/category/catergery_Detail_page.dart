import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  final String title;
  final String image;

  const CategoryDetailPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 100),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'This is a dummy detail page.\nAPI data will come later.',
              textAlign: TextAlign.center,
              style: theme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
