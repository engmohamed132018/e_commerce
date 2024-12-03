import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_helper/dio_consumer.dart';
import 'package:e_commerce/features/home/home_data/home_data_model/product_model.dart';
import 'package:e_commerce/features/home/home_data/home_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HomeDataRepo repo = HomeDataRepo(dioCunsumer: DioConsumer(dio: Dio()));
  List<Product> products = [];
  List<String> categories = [];
  int? navBarIndex = 0;

  //! get all producties
  getAllProducts() async {
    emit(HomeProductsLoading());
    try {
      products = await repo.getAllProducts();
      emit(HomeProductsScusses(products: products));
    } catch (e) {
      emit(HomeProductsFailure(message: e));
    }
  }

  //! get all Category
  getCategories() async {
    emit(HomeCategoryLoading());
    try {
      categories = await repo.getCategory();
      emit(HomeCategoryScusses(category: categories));
    } catch (e) {
      emit(HomeCategoryFailure(message: e));
    }
  }

  List<Product> productsByCategory(String category) {
    final productsbyCategory = products
        .where(
          (element) => element.category == category,
        )
        .toList();
    return productsbyCategory;
  }

  setNavBarIndex(int value) {
    emit(HomeNavBarLoading());
    navBarIndex = value;
    emit(HomeNavBarScusses(index: navBarIndex!));
  }
}
