import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_paraguay/core/app_router.dart';
import 'package:todo_paraguay/core/authentication_store.dart';
import 'package:todo_paraguay/shared/debounce/debouncer.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';
import 'package:todo_paraguay/shared/widgets/bottombar_widget.dart';
import 'package:todo_paraguay/shared/widgets/drawer_widget.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/bloc/events/product_events.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/bloc/product_bloc.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/bloc/states/product_state_bloc.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/widgets/app_bar.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/widgets/new_item_list.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/widgets/popular_Item_list.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/widgets/search_bar_widget.dart';

class ProductHomePageBloc extends StatefulWidget {
  final ProductBloc bloc;
  final IAuthentication auth;
  const ProductHomePageBloc({
    Key? key,
    required this.bloc,
    required this.auth,
  }) : super(key: key);

  @override
  State<ProductHomePageBloc> createState() => _ProductHomePageBlocState();
}

class _ProductHomePageBlocState extends State<ProductHomePageBloc>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.bloc.add(FetchProductEvent());
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
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is EmptyProductState) {
            return const Center(
              child: Center(
                child: LinearProgressIndicator(),
              ),
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
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(),
                  SearchBarWidget(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _debouncer.run(
                            () => widget.bloc.add(SearchProductEvent(value)));
                      } else {
                        _debouncer
                            .run(() => widget.bloc.add(FetchProductEvent()));
                      }
                    },
                    searchClose: () {
                      widget.bloc.add(FetchProductEvent());
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: false,
                      //physics: ScrollPhysics(),
                      children: [
                        ListView.builder(
                          itemCount: state.products.length,
                          padding: const EdgeInsets.only(
                              top: 25, right: 25, left: 25),
                          physics: const NeverScrollableScrollPhysics(),
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
                ],
              )),
            );
          }
          if (state is SuccessProductState) {
            final newItem = state.products
                .where((product) => product.newItem == true)
                .toList();

            final popularList = state.products
                .where(
                  (product) => product.votes >= 0,
                )
                .toList();

            final promoList = state.products
                .where((product) => product.promo == true)
                .toList();

            return DefaultTabController(
              length: 3,
              child: Scaffold(
                drawer: const DrawerWidget(),
                resizeToAvoidBottomInset: true,
                body: SafeArea(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const AppBarWidget(),
                      SearchBarWidget(
                        onTap: () {
                          _debouncer.run(
                              () => widget.bloc.add(SearchProductEvent('')));
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
                                  child: const Text('Promo'),
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
                                itemCount: newItem.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final product = newItem[index];
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
                                  itemCount: popularList.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final product = popularList[index];
                                    return NewItemList(
                                      name: product.name,
                                      description: product.description,
                                      price: product.price,
                                      image: product.image,
                                    );
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 21),
                              height: 210,
                              child: ListView.builder(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 6),
                                  itemCount: promoList.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final product = promoList[index];
                                    return NewItemList(
                                      name: product.name,
                                      description: product.description,
                                      price: product.price,
                                      image: product.image,
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
                          state.products.sort((a, b) {
                            return b.votes.compareTo(a.votes);
                          });
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
                bottomNavigationBar: BottonBarWidget(
                  exit: () {
                    print('Exit');
                    widget.auth.logout();
                    AppRouter.navigatorKey.currentState
                        ?.pushNamed(AppRouter.SPLASH);
                  },
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
