import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';
import 'package:todo_paraguay/shared/themes/text_styles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.cinzaFraco,
                expandedHeight: sizeHeight * 0.5,
                flexibleSpace: Container(
                  height: sizeHeight * 0.5,
                  color: AppColors.cinzaForte,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 62),
                          height: 225,
                          width: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.branco,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 25),
                      child: Text(
                        'More Info',
                        style: AppTextStyles.text22boldW600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, left: 25),
                      child: Text(
                        'About You',
                        style: AppTextStyles.text14boldW600preto,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, left: 25),
                          child: Text(
                            '\$',
                            style: AppTextStyles.text14boldW600preto,
                          ),
                        ),
                        Text(
                          '20',
                          style: AppTextStyles.text32boldW600,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        'Descrición',
                        style: AppTextStyles.text14boldW600preto,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 25,
                      ),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\n ',
                        style: TextStyle(letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        //color: AppColors.cinzaFraco,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Like',
            style: AppTextStyles.text14boldW600preto,
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.cinzaFraco),
          ),
        ),
      ),
    );
  }
}
