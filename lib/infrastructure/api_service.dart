import 'package:dio/dio.dart';
import 'package:flutter_challenge/domain/entities/product.dart';

const String baseURL = 'https://fakestoreapi.com';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseURL));
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Product> products = List<Product>.from(
          data.map(
            (item) => Product.fromJson(item as Map<String, dynamic>),
          ),
        );
        return products;
      } else {
        throw Exception(
          'Failed to load products: Status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
