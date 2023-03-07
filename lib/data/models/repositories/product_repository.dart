import 'package:test_project/data/models/api/response/Products/Products.dart';
import '../../../network/server_api.dart';

class ProductRepository {
  final RestClient client;

  ProductRepository(this.client);

  Future<List<Products>> getAllProducts() {
    return client.getProducts();
  }
}