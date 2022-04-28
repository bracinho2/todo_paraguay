import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';
import 'package:todo_paraguay/src/home/detail/detail_page.dart';

import 'package:todo_paraguay/src/product/domain/entities/product_entity.dart';

class PopularItemList extends StatelessWidget {
  final ProductEntity product;
  const PopularItemList({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://img.olx.com.br/images/88/883292515784593.jpg')),
                borderRadius: BorderRadius.circular(10),
                //color: AppColors.cinzaFraco,
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
                  product.name,
                  style: AppTextStyles.text22boldW600,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product.description,
                  style: AppTextStyles.text14boldW600preto,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'U\$D ' + product.value.toString(),
                  style: AppTextStyles.text14boldW600preto,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
