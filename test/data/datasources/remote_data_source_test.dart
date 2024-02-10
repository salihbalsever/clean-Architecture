import 'dart:convert';

import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group('Test for getting products of remote', () {
    test('should create a getProducts from remote', () async {

      final remoteDataSource = ProductRemoteDataSource(client: MockClient((request) async{
        switch(request.url.path) {
          case '/products':
            return Response(jsonEncode([productJson]), 200);
          default:
            return Response('Not Found', 404);
        }

      }
      ));
      final responseExample = await remoteDataSource.getProducts();
      expect(responseExample[0].title, "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops");
      expect(responseExample[0].price, 109.95);    });

  });
}
Map<String, dynamic> productJson = {
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
};