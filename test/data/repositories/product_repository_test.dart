import 'package:diwithriverpood/data/models/product_model.dart';
import 'package:diwithriverpood/data/models/rating_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'product_repository_mock.dart';

void main() {
  group('product repository', () {
    test('should create a Product function from a valid List', () {
      final productRepository = ProductRepositoryMock();
      expect(productRepository.getProducts(), isA<Future<List<Product>>>());
    });

  });
}

