import 'package:e_commerce/features/home/home_data/home_data_model/product_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeProductsLoading extends HomeState {}

final class HomeNavBarLoading extends HomeState {}

final class HomeNavBarScusses extends HomeState {
  final int index;

  HomeNavBarScusses({required this.index});
}

final class HomeProductsScusses extends HomeState {
  final List<Product> products;

  HomeProductsScusses({required this.products});
}

final class HomeProductsFailure extends HomeState {
  final dynamic message;

  HomeProductsFailure({required this.message});
}

final class HomeCategoryLoading extends HomeState {}

final class HomeCategoryScusses extends HomeState {
  final List<String> category;

  HomeCategoryScusses({required this.category});
}

final class HomeCategoryFailure extends HomeState {
  final dynamic message;

  HomeCategoryFailure({required this.message});
}
