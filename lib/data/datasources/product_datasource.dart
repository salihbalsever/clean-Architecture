import 'dart:convert';

import '../../domain/models/product_model.dart';
import '../../core/base_model.dart';
import 'package:http/src/client.dart';
import 'package:http/http.dart' as http;
abstract class IProductDataSource {
  Future<List<Product>> getData({
    required String subUrl,
    Map<String, String>? filterHeaders,
  });
}
class ProductDataSource extends IProductDataSource{
  Client client = http.Client();

  @override
  Future<List<Product>> getData({required String subUrl, Map<String, String>? filterHeaders}) async{
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json',

    };
    final response = await client.get(Uri.parse("https://fakestoreapi.com/$subUrl"),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      final resultPosts =
      List<Product>.from(decodedBody.map((e) => Product.fromJson(e)));
      return resultPosts;
    }
    else {
      return [];
    }
  }

}