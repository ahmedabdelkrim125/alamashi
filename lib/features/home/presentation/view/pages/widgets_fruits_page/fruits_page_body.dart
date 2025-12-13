import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/Widgets/custom_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/Widgets/products_carousel_pages.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_fruits_page/category_tabs.dart';
import 'package:egyptian_supermaekat/features/home/presentation/viewmodel/segmented_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitsPageBody extends StatelessWidget {
  const FruitsPageBody({super.key});
  final List<Map<String, String>> productsData = const [
    {
      'image': Assets.rectangle_8,
      'title': 'فواكهه , فراولة',
      'size': '1 كجم',
      'price': '15',
    },
    {
      'image': Assets.rectangle_9,
      'title': 'فواكهة, بطيخ',
      'size': '1 كجم',
      'price': '15',
    },
    {
      'image': Assets.rectangle_10,
      'title': 'فواكهه , برتقال',
      'size': '1 كجم',
      'price': '15',
    },
    {
      'image': Assets.rectangle_11,
      'title': 'خضار , ليمون',
      'size': '1 كجم',
      'price': '15',
    },
    {
      'image': Assets.rectangle_12,
      'title': 'فواكهة , موز',
      'size': '1 كجم',
      'price': '15',
    },
    {
      'image': Assets.rectangle_13,
      'title': 'خضار , فلفل ألوان',
      'size': '1 كجم',
      'price': '15',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SegmentedTabCubit(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: CustomAppBar(
                  title: 'الفواكهة والخضروات',
                  onPressed: () {},
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(child: CategoryTabs()),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = productsData[index];
                    return ProductsCarouselPages(
                      image: product['image']!,
                      title: product['title']!,
                      size: product['size']!,
                      price: product['price']!,
                    );
                  }, childCount: productsData.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
