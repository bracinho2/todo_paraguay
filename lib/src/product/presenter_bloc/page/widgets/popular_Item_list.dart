import 'package:flutter/material.dart';

import 'package:todo_paraguay/shared/themes/text_styles.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/page/product_detail_page_bloc.dart';

class PopularItemList extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String image;
  const PopularItemList({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPageBloc(
              name: name,
              description: description,
              price: price,
              image: image,
            ),
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
                image: DecorationImage(image: NetworkImage(image)),
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
                  name,
                  style: AppTextStyles.text22boldW600,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: AppTextStyles.text14boldW600preto,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'U\$D ' + price.toString(),
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
