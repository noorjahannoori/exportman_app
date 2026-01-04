import 'package:exportman/Model/home_page_model/catergory_model.dart';
import 'package:exportman/Model/home_page_model/home_model.dart';
import 'package:exportman/Model/home_page_model/service_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = Provider<HomeData>((ref) {
  return HomeData(
    sliders: [
      'assets/images/Image.png',
      'assets/images/Image.png',
      'assets/images/Image.png',
      'assets/images/Image.png',
    ],

    categories: [
      CategoryModel(title: 'Plumber', image: 'assets/images/Icon8.png'),
      CategoryModel(title: 'Security', image: 'assets/images/Icon5.png'),
      CategoryModel(title: 'Smart Home', image: 'assets/images/Icon3.png'),
      CategoryModel(title: 'Pest Control', image: 'assets/images/Icon4.png'),
      CategoryModel(title: 'Carpenter', image: 'assets/images/Icon1.png'),
      CategoryModel(title: 'Painter', image: 'assets/images/Icon.png'),
      CategoryModel(title: 'AC Repair', image: 'assets/images/Icon2.png'),
      CategoryModel(title: 'Salon', image: 'assets/images/Icon1.png'),
    ],

    services: [
      ServiceModel(
        title: 'Home Cleaning',
        image: 'assets/images/Bg.png',
        description: 'Professional home cleaning service',
        category: 'Cleaning',
        price: '\$25',
        rating: 4.8,
        providerName: 'John Smith',
        providerImage: 'assets/images/Bg.png',
      ),
      ServiceModel(
        title: 'AC Repair',
        image: 'assets/images/service.png',
        description: 'Fast AC repair & maintenance',
        category: 'Repair',
        price: '\$299',
        rating: 4.6,
        providerName: 'David Miller',
        providerImage: 'assets/images/service.png',
      ),
    ],
  );
});
