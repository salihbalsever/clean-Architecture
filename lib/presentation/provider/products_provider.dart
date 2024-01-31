import 'package:diwithriverpood/data/datasources/product_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';


class ProductProvider extends StateNotifier<List<Product>> {
  ProductProvider() : super([]);

  ProductDataSource productDataSource = ProductDataSource();
  List<Product> productList = [];
  void initialize() {
    getProducts();
  }
 Future getProducts() async{
    try{
     productList= await productDataSource.getData(subUrl:"products");
     state=productList;
    }catch(e){
       if (kDebugMode) {
         print(e.toString());
       }
       rethrow;
    }
  }
}

final productProvider = StateNotifierProvider<ProductProvider, List<Product>>((ref) => ProductProvider()..getProducts());
