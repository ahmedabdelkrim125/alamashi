import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

/// A responsive grid that adapts to different screen sizes
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.padding,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(context);

    return Padding(
      padding: padding ?? ResponsiveHelper.getPadding(context),
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing ?? 16.0,
        crossAxisSpacing: crossAxisSpacing ?? 16.0,
        childAspectRatio: 0.8,
        children: children,
      ),
    );
  }
}

/// A responsive grid item with adaptive sizing
class ResponsiveGridItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;

  const ResponsiveGridItem({super.key, required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(margin: margin, clipBehavior: Clip.antiAlias, child: child);
  }
}
