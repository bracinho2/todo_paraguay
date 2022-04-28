import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
