import 'package:flutter/material.dart';

import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';

class ProductDetailPageBloc extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String image;

  const ProductDetailPageBloc({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.cinzaFraco,
              expandedHeight: sizeHeight * 0.5,
              flexibleSpace: Container(
                height: sizeHeight * 0.5,
                color: AppColors.cinzaForte,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 210,
                        width: 210,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // Image border
                            child: Image.network(
                                'https://img.olx.com.br/images/88/883292515784593.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      'Información',
                      style: AppTextStyles.text22boldW600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 25),
                    child: Text(
                      name,
                      style: AppTextStyles.text14boldW600preto,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7, left: 25),
                        child: Text(
                          '\$',
                          style: AppTextStyles.text14boldW600preto,
                        ),
                      ),
                      Text(
                        price.toString(),
                        style: AppTextStyles.text32boldW600,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      'Descrición',
                      style: AppTextStyles.text14boldW600preto,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 25,
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(letterSpacing: 1.2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        //color: AppColors.cinzaFraco,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Like',
            style: AppTextStyles.text14boldW600preto,
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.cinzaFraco),
          ),
        ),
      ),
    );
  }
}
