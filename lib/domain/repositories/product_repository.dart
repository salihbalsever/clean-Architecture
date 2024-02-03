import '../../data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllPersons();
}
class ProductInteractor {
  final ProductRepository productRepository;
  ProductInteractor(this.productRepository);

  Future<List<Product>> getAllPersons() async {
    return productRepository.getAllPersons();
  }
}