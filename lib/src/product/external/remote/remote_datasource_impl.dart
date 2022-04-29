import 'package:todo_paraguay/src/product/infra/datasource/product_datasource_interface.dart';

class ProductDatasourceImpl implements IProductDatasource {
  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    //dados para teste;
    final mockvalues = [
      {
        "id": "1",
        "name": "Yaesu FT 2900",
        "description": "Radio VHF",
        "store": "America",
        "price": "250",
        "discount": "0",
        "priority": "0",
        "votes": "7",
        "image": "https://img.olx.com.br/images/88/883292515784593.jpg",
        "promo": false
      },
      {
        "id": "1",
        "name": "Icom IC 2200",
        "description": "Radio VHF",
        "store": "America",
        "price": "230.0",
        "discount": "0",
        "priority": "0",
        "votes": "7",
        "image": "https://img.olx.com.br/images/88/883292515784593.jpg",
        "promo": false
      },
      {
        "id": "1",
        "name": "Kenwood TK 210",
        "description": "Radio VHF",
        "store": "America",
        "value": "185.0",
        "discount": "0",
        "priority": "0",
        "votes": "7",
        "image": "https://img.olx.com.br/images/88/883292515784593.jpg",
        "promo": false
      },
    ];

    return mockvalues;
  }
}
