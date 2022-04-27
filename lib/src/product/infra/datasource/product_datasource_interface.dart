abstract class IProductDatasource {
  Future<List<Map<String, dynamic>>> getProducts();
}
