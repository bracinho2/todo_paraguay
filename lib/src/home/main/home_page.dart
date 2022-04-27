import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';
import 'package:todo_paraguay/src/product/domain/entities/product_entity.dart';
import 'package:todo_paraguay/src/product/domain/usecases/get_product_usecase.dart';
import 'package:todo_paraguay/src/product/external/remote/remote_datasource_impl.dart';
import 'package:todo_paraguay/src/product/infra/repositories/get_product_impl.dart';

import '../detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final usecase =
    GetProductsUsecase(ProductRepositoryImpl(ProductDatasourceImpl()));

class _HomePageState extends State<HomePage> {
  List<ProductEntity> list = [];

  void popular() async {
    list = await usecase.call();
    print(list);
  }

  @override
  void initState() {
    popular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola que tal',
                    style: AppTextStyles.text14boldW600cinza,
                  ),
                  Text(
                    'Que procuras?',
                    style: AppTextStyles.text22boldW600,
                  ),
                ],
              ),
            ),
            Container(
              height: 39,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cinzaFraco,
              ),
              child: Stack(
                children: [
                  TextField(
                    style: AppTextStyles.text14boldW600cinza,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 19, right: 50, bottom: 8),
                      border: InputBorder.none,
                      hintText: 'busque lo que necessitas',
                      hintStyle: AppTextStyles.text14boldW600preto,
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    bottom: 6,
                    child: Icon(Icons.search),
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                  isScrollable: true,
                  labelColor: AppColors.preto,
                  labelStyle: AppTextStyles.text14boldW600preto,
                  unselectedLabelStyle: AppTextStyles.text14boldW600cinza,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: Container(
                        margin: const EdgeInsets.only(right: 23),
                        child: const Text('Nuevo'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: const EdgeInsets.only(right: 23),
                        child: const Text('Popular'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: const EdgeInsets.only(right: 23),
                        child: const Text('Bla'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 21),
              height: 210,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 25, right: 6),
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 19),
                      height: 210,
                      width: 153,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.laranja,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'Popular',
                style: AppTextStyles.text22boldW600,
              ),
            ),
            ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 19),
                    height: 81,
                    width: MediaQuery.of(context).size.width - 50,
                    //color: AppColors.cinzaForte,
                    child: Row(
                      children: [
                        Container(
                          height: 81,
                          width: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.cinzaFraco,
                          ),
                        ),
                        const SizedBox(
                          width: 21,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Título Grande',
                              style: AppTextStyles.text22boldW600,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Subtitulo menor',
                              style: AppTextStyles.text14boldW600preto,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'R\$ 50,00',
                              style: AppTextStyles.text14boldW600preto,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
