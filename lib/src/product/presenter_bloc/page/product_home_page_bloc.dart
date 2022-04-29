import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';
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

class _ProductHomePageBlocState extends State<ProductHomePageBloc>
    with SingleTickerProviderStateMixin {
  late final ProductBloc bloc;

  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
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

          if (state is SearchProductState) {
            return Scaffold(
              body: SafeArea(
                  child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const AppBarWidget(),
                  SearchBarWidget(
                    onChanged: (value) {
                      if (value.isEmpty) {}
                      bloc.add(SearchProductEvent(value));
                    },
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
                        name: product.name,
                        description: product.description,
                        price: product.price,
                        image: product.image,
                      );
                    },
                  ),
                ],
              )),
            );
          }
          if (state is SuccessProductState) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SafeArea(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const AppBarWidget(),
                      SearchBarWidget(
                        onChanged: (value) {
                          bloc.add(SearchProductEvent(value));
                        },
                      ),
                      Container(
                        height: 25,
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.only(left: 25),
                        child: DefaultTabController(
                          length: 3,
                          child: TabBar(
                            controller: tabController,
                            labelPadding: const EdgeInsets.all(0),
                            indicatorPadding: const EdgeInsets.all(0),
                            isScrollable: true,
                            labelColor: AppColors.preto,
                            labelStyle: AppTextStyles.text14boldW600preto,
                            unselectedLabelStyle:
                                AppTextStyles.text14boldW600cinza,
                            indicatorColor: Colors.transparent,
                            tabs: [
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 23),
                                  child: const Text('Nuevo'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 23),
                                  child: const Text('Popular'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 23),
                                  child: const Text('Usados'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        height: 210,
                        width: double.maxFinite,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 210,
                              child: ListView.builder(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 6),
                                itemCount: state.products.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final product = state.products[index];
                                  return NewItemList(
                                    name: product.name,
                                    description: product.description,
                                    price: product.price,
                                    image: product.image,
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 210,
                              child: ListView.builder(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 6),
                                  itemCount: state.products.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 19),
                                      height: 210,
                                      width: 153,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.cinzaFraco,
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 210,
                              child: ListView.builder(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 6),
                                  itemCount: state.products.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 19),
                                      height: 210,
                                      width: 153,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.cinzaForte,
                                      ),
                                    );
                                  }),
                            ),
                          ],
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
                            name: product.name,
                            description: product.description,
                            price: product.price,
                            image: product.image,
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
