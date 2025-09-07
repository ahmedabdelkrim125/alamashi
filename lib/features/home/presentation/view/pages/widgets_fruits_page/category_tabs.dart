import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_fruits_page/single_tab.dart';
import 'package:egyptian_supermaekat/features/home/presentation/viewmodel/segmented_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});
  final List<String> _tabs = const ['الكل', 'خضروات طازجة', 'خضروات جذرية'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SegmentedTabCubit, int>(
      builder: (context, selectedIndex) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
              children: List.generate(
            _tabs.length,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SingleTab(
                  title: _tabs[index],
                  isSelected: selectedIndex == index,
                  onTap: () =>
                      context.read<SegmentedTabCubit>().selectTab(index),
                ),
              );
            },
          )),
        );
      },
    );
  }
}
