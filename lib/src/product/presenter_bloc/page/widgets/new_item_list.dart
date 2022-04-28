import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/src/home/detail/detail_page.dart';

class NewItemList extends StatelessWidget {
  final String title;
  const NewItemList({
    Key? key,
    required this.title,
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
        child: Image.network(
            'https://img.olx.com.br/images/88/883292515784593.jpg'),
        margin: const EdgeInsets.only(
          right: 19,
        ),
        height: 210,
        width: 153,
        decoration: BoxDecoration(
          // image: const DecorationImage(
          //     image: NetworkImage(
          //         'https://img.olx.com.br/images/88/883292515784593.jpg')),
          borderRadius: BorderRadius.circular(10),
          //color: AppColors.laranja,
        ),
      ),
    );
  }
}
