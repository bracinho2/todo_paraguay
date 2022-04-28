import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/page/product_home_page_bloc.dart';
import 'package:todo_paraguay/src/product/product_injection.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...productModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: const ProductHomePageBloc(),
      ),
    );
  }
}
