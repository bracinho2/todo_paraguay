import 'package:flutter/material.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/product_detail_page_bloc.dart';

class NewItemList extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String image;
  const NewItemList({
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
      child: SizedBox(
        height: 210,
        width: 153,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
