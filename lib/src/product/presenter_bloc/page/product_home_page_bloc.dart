import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';
import 'package:todo_paraguay/src/home/detail/detail_page.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/bloc/events/product_events.dart';

import 'package:todo_paraguay/src/product/presenter_bloc/bloc/product_bloc.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/bloc/states/product_state_bloc.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/page/widgets/app_bar.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/page/widgets/new_item_list.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/page/widgets/popular_Item_list.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/page/widgets/search_bar_widget.dart';

class ProductHomePageBloc extends StatefulWidget {
  const ProductHomePageBloc({Key? key}) : super(key: key);

  @override
  State<ProductHomePageBloc> createState() => _ProductHomePageBlocState();
}

class _ProductHomePageBlocState extends State<ProductHomePageBloc> {
  late final ProductBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<ProductBloc>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      bloc.add(FetchProductEvent());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductStateBloc>(
        bloc: bloc,
        builder: (context, state) {
          if (state is EmptyProductState) {
            return const Center(
              child: Text('Não Carregou!'),
            );
          }
          if (state is LoadingProductState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is SuccessProductState) {
            return DefaultTabController(
              length: state.products.length,
              child: Scaffold(
                body: SafeArea(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const AppBarWidget(),
                      const SearchBarWidget(),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          'Novos',
                          style: AppTextStyles.text22boldW600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 21),
                        height: 210,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 25, right: 6),
                          itemCount: 3,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return NewItemList(
                              title: product.name,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          'Popular',
                          style: AppTextStyles.text22boldW600,
                        ),
                      ),
                      ListView.builder(
                        itemCount: state.products.length,
                        padding:
                            const EdgeInsets.only(top: 25, right: 25, left: 25),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return PopularItemList(
                            product: product,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
