import 'package:flutter/material.dart';

import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? searchClose;

  const SearchBarWidget({
    Key? key,
    this.onChanged,
    this.controller,
    this.onTap,
    this.searchClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cinzaFraco,
      ),
      child: TextField(
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.amber,
        style: AppTextStyles.text14boldW600preto,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 19, right: 50, top: 5),
          border: InputBorder.none,
          hintText: 'busque lo que necessitas',
          hintStyle: AppTextStyles.text14boldW600preto,
          suffixIcon: GestureDetector(
            child: onChanged != null
                ? const Icon(Icons.close)
                : const Icon(Icons.check_circle),
            onTap: onChanged != null ? searchClose : null,
          ),
        ),
      ),
    );
  }
}
