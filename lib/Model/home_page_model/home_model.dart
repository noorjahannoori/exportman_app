import 'package:exportman/Model/home_page_model/catergory_model.dart';
import 'package:exportman/Model/home_page_model/service_model.dart';

class HomeData {
  final List<String> sliders;
  final List<CategoryModel> categories;
  final List<ServiceModel> services;

  HomeData({
    required this.sliders,
    required this.categories,
    required this.services,
  });
}
