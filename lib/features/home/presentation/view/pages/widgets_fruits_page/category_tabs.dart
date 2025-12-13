import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_fruits_page/single_tab.dart';
import 'package:egyptian_supermaekat/features/home/presentation/viewmodel/segmented_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});
  final List<String> _tabs = const ['الكل', 'خضروات طازجة', 'خضروات جذرية'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SegmentedTabCubit, int>(
      builder: (context, selectedIndex) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = ResponsiveHelper.isTablet(context);
            final horizontalPadding = isTablet ? 24.0 : 16.0;
            final tabPadding = isTablet ? 6.0 : 4.0;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: tabPadding),
                    child: SingleTab(
                      title: _tabs[index],
                      isSelected: selectedIndex == index,
                      onTap: () =>
                          context.read<SegmentedTabCubit>().selectTab(index),
                    ),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}
