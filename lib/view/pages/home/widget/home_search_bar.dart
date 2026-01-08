import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';


class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -25,
      left: 20,
      right: 20,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 50,
                    offset: Offset(0, 24),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('Search'),
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 50,
                  offset: Offset(0, 24),
                ),
              ],
            ),
            child: const Icon(Icons.search, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
