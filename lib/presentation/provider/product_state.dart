import '../../data/models/product_model.dart';

class ProductState{

  bool dataExists;
  List<Product> productList;

  ProductState({required this.dataExists, required this.productList});

  ProductState copyWith({
    bool? dataExists,
    List<Product>? productList,
  }) {
    return ProductState(
      dataExists: dataExists ?? this.dataExists,
      productList: productList ?? this.productList,
    );
  }
}