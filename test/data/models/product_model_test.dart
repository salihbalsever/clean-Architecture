import 'package:diwithriverpood/data/models/product_model.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product.fromJson', () {
    test('should create a Product instance from a valid JSON', () {
      // Arrange
      final Map<String, dynamic> json = {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {
          "rate": 3.9,
          "count": 120
        }
        // Add other fields as needed
      };

      // Act
      final product = Product.fromJson(json);

      // Assert
      expect(product, isA<Product>());
      expect(product.id, json['id']);
      expect(product.title, json['title']);
      // Add additional assertions for other fields
    });

    test('should throw an exception for invalid JSON', () {
      // Arrange
      final Map<String, dynamic> invalidJson = {
      };

      // Act & Assert
      expect(() => Product.fromJson(invalidJson), throwsA(isA<TypeError>()));
    });

    // Add more test cases if needed, such as testing edge cases or specific field validations
  });
}

