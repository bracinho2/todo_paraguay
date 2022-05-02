import 'package:todo_paraguay/src/product/infra/datasource/product_datasource_interface.dart';

class ProductDatasourceImpl implements IProductDatasource {
  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    //dados para teste;
    final mockvalues = [
      {
        "id": "1",
        "name": "Yaesu FT 2900 7",
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
        "name": "Icom IC 2200 8",
        "description": "Radio VHF",
        "store": "America",
        "price": "230.0",
        "discount": "0",
        "priority": "0",
        "votes": "8",
        "image":
            "https://http2.mlstatic.com/D_NQ_NP_353815-MLB25301522351_012017-O.webp",
        "promo": false
      },
      {
        "id": "1",
        "name": "Kenwood TK 210 18",
        "description": "Radio VHF",
        "store": "America",
        "price": "185.0",
        "discount": "0",
        "priority": "0",
        "votes": "18",
        "image":
            "https://1.bp.blogspot.com/-JfMv-c0scK0/YHcg8hqp3bI/AAAAAAAAJY0/udRJvPKxzZgSzCxr-geFKydn811C3DKngCLcBGAsYHQ/s854/-%2BFOTO%2BMAIS%2BNEWS%2B1.jpg",
        "promo": false
      },
    ];

    return mockvalues;
  }
}
