import 'package:e_commerce/core/constant/app_string.dart';

class CategoryTestModel {
  final String name;
  final String image;

  CategoryTestModel({required this.name, required this.image});
}

List<CategoryTestModel> categoryListTest = [
  CategoryTestModel(name: "electronics", image: AppString.electronics),
  CategoryTestModel(name: "men's clothing", image: AppString.mensClothing),
  CategoryTestModel(name: "jewelery", image: AppString.jewelery),
  CategoryTestModel(name: "women's clothing", image: AppString.womensClothing),
];
