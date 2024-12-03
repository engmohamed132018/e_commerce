class CategoryModel {
  final String categoryName;

  CategoryModel({required this.categoryName});
  factory CategoryModel.formJson(dynamic data) {
    return CategoryModel(categoryName: data);
  }
}
