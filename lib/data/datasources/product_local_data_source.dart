import 'package:diwithriverpood/data/models/product_model.dart';
import 'package:hive/hive.dart';

abstract class IProductLocalDataSource{

  //Future<Box> openBox();

  //Future<void> closeBox(Box<Product> box);

  Future<void> addItems(List<Product> products);

  Future<List<Product>> getProducts();

}

class ProductLocalDataSource extends IProductLocalDataSource{
  static const key= "products";
  Future<Box> get openProductBox async {
    return await _openBox();
  }
  @override
  Future<void> addItems(List<Product> products) async {
    try{
      final box = await _openBox();
      box.put(key, products);
      await _closeBox(box);
    }catch(e){
      print('Error: $e');
    }
  }



   Future<void> _closeBox(Box box) async{
    await box.close();
  }

  @override
  Future<List<Product>> getProducts() async {
    final box = await _openBox();
    List<dynamic> rawProducts = box.get(key, defaultValue: []);
    List<Product> products = List<Product>.from(rawProducts);
    await _closeBox(box);
    return products.isNotEmpty ? products : [];
  }


  @override
  Future<Box> _openBox() async {
    return await Hive.openBox("product");
  }
}