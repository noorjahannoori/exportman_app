import 'package:exportman/Model/review_model/review_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewProvider = Provider<List<ReviewModel>>((ref) {
  return [
    ReviewModel(
      userName: 'Ali Khan',
      userImage: 'assets/images/boy.png',
      date: '12 Jan 2025',
      rating: 4.5,
      description: 'Very professional service. Highly recommended.',
    ),
    ReviewModel(
      userName: 'Ahmed Raza',
      userImage: 'assets/images/boy.png',
      date: '10 Jan 2025',
      rating: 4.3,
      description: 'Good work, on time and polite behavior.',
    ),
    ReviewModel(
      userName: 'Usman',
      userImage: 'assets/images/boy.png',
      date: '08 Jan 2025',
      rating: 5.0,
      description: 'Excellent experience. Will book again.',
    ),
  ];
});
