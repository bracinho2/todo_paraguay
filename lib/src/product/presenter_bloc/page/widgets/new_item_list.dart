import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';

class NewItemList extends StatelessWidget {
  final String title;
  const NewItemList({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(title),
        ),
      ),
      margin: const EdgeInsets.only(
        right: 19,
      ),
      height: 210,
      width: 153,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: NetworkImage(
                'https://img.olx.com.br/images/88/883292515784593.jpg')),
        borderRadius: BorderRadius.circular(10),
        //color: AppColors.laranja,
      ),
    );
  }
}
