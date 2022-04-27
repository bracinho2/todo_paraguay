import 'package:todo_paraguay/src/product/infra/datasource/product_datasource_interface.dart';

class ProductDatasourceImpl implements IProductDatasource {
  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    //dados para teste;
    final mockvalues = [
      {
        "id": "1",
        "name": "Radio",
        "description": "Radio VHF",
        "store": "America",
        "value": "250",
        "discount": "0",
        "priority": "0",
        "votes": "7",
        "promo": "false"
      },
    ];

    return mockvalues;
  }
}
