import 'package:diwithriverpood/data/datasources/product_local_data_source.dart';
import 'package:diwithriverpood/data/models/product_model.dart';
import 'package:diwithriverpood/data/models/rating_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'local_data_source_mock.dart';
GetIt getIt = GetIt.instance;

void main() {
  group('should create a getProducts and addProducts() function', () {
    test('should create a getProducts', () async {
      getIt.registerSingleton<IProductLocalDataSource>(ProductLocalDataSource());

      final product = TestLocalDataSourceMock();
      expect(product.getProducts(), isA<Future<List<Product>>>());
    });
    test('should create an addProducts() function', () async {
      final newProducts = [
        Product(
          id: 3,
          title: 'Product 3',
          price: 39.99,
          description: 'Description for Product 3',
          category: 'Category 3',
          image: 'image3.jpg',
          rating: Rating(rate: 4.2, count: 120),
        ),
        Product(
          id: 4,
          title: 'Product 4',
          price: 49.99,
          description: 'Description for Product 4',
          category: 'Category 4',
          image: 'image4.jpg',
          rating: Rating(rate: 4.8, count: 150),
        ),
        // Add more products as needed
      ];

      final product = TestLocalDataSourceMock();
      await product.addItems(newProducts);
      final products = await product.getProducts();

      expect(products.length, equals(products.length));
      expect(products.last.id, equals(newProducts.last.id));  // Adjust this based on your Product model
      expect(products.last.title, equals(newProducts.last.title));  // Adjust this based on your Product mode
    });
  });
}
