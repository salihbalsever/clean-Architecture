import 'package:diwithriverpood/data/datasources/product_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider(){
    getProducts();
  }
  ProductDataSource productDataSource = ProductDataSource();
  List<Product> productList = [];

 Future getProducts() async{
    try{
     productList= await productDataSource.getData(subUrl:"products");
    }catch(e){
       if (kDebugMode) {
         print(e.toString());
       }
       notifyListeners();
       rethrow;
    }
    notifyListeners();

  }
}
final productProvider = ChangeNotifierProvider<ProductProvider>((ref) {
  return ProductProvider();
});
