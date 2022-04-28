import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
