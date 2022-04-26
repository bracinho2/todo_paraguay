import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
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
          ),
          Container(
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
          ),
          Container(
            height: 25,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(left: 25),
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                labelPadding: const EdgeInsets.all(0),
                indicatorPadding: const EdgeInsets.all(0),
                isScrollable: true,
                labelColor: AppColors.preto,
                labelStyle: AppTextStyles.text14boldW600preto,
                unselectedLabelStyle: AppTextStyles.text14boldW600cinza,
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
                      child: const Text('Bla'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
