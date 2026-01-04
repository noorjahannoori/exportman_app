import 'package:flutter/material.dart';
import 'package:exportman/Model/home_page_model/service_model.dart';

class ServiceDetailPage extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(service.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(service.image, height: 180, fit: BoxFit.cover),
            const SizedBox(height: 16),

            Text(service.title, style: theme.titleLarge),
            const SizedBox(height: 8),

            Text(service.description, style: theme.bodyMedium),
            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(service.rating.toString()),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(service.providerImage),
                ),
                const SizedBox(width: 8),
                Text(service.providerName, style: theme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
