import 'package:e_commerce/core/api_helper/api_endpoint.dart';
import 'package:e_commerce/core/api_helper/dio_consumer.dart';
import 'package:e_commerce/features/home/home_data/home_data_model/product_model.dart';

class HomeDataRepo {
  final DioConsumer dioCunsumer;

  HomeDataRepo({required this.dioCunsumer});

  Future<List<Product>> getAllProducts() async {
    final List<dynamic> response = await dioCunsumer.get(EndPiont.products);
    final products = response.map((e) => Product.fromJson(e)).toList();

    return products;
  }

  Future<List<String>> getCategory() async {
    List<String> Categories = [];

    final List<dynamic> response = await dioCunsumer.get(EndPiont.categories);
    Categories = response.map((e) => e.toString()).toList();
    return Categories;
  }
}
