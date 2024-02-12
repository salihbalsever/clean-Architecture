import 'dart:convert';

import 'package:diwithriverpood/data/datasources/product_local_data_source.dart';
import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';
import 'package:diwithriverpood/data/models/product_model.dart';
import 'package:diwithriverpood/data/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../datasources/local_data_source_mock.dart';
import '../datasources/remote_data_source_test.dart';
GetIt getIt = GetIt.instance;

void main() {
  final client= MockClient((request) async{
    switch(request.url.path) {
      case '/products':
        return Response(jsonEncode([productJson]), 200);
      default:
        return Response('Not Found', 404);
    }

  });
  getIt.registerSingleton<IProductLocalDataSource>(TestLocalDataSourceMock());
  getIt.registerSingleton<IProductRemoteDataSource>(ProductRemoteDataSource(client: client));
  group('product repository', () {
    test('should create a Product function from a valid List', () {

      final productRepository = ProductRepository();
      expect(productRepository.getProducts(), isA<Future<List<Product>>>());
    });

  });

}

