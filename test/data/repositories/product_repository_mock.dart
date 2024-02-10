import 'package:diwithriverpood/data/models/product_model.dart';
import 'package:diwithriverpood/data/models/rating_model.dart';
import 'package:diwithriverpood/data/repositories/product_repository.dart';

class ProductRepositoryMock extends IProductRepository {
  @override
  Future<List<Product>> getProducts() async{
    return productList;
  }

  List<Product> productList = [
    Product(
      id: 1,
      title: 'Product 1',
      price: 19.99,
      description: 'Description for Product 1',
      category: 'Category 1',
      image: 'image1.jpg',
      rating: Rating(rate: 4.5, count: 100),
    ),
    Product(
      id: 2,
      title: 'Product 2',
      price: 29.99,
      description: 'Description for Product 2',
      category: 'Category 2',
      image: 'image2.jpg',
      rating: Rating(rate: 3.8, count: 75),
    ),
    // Add more products as needed
  ];
}
