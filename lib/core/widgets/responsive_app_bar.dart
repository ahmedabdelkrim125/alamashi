import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A responsive app bar that adapts to different screen sizes
/// Uses MediaQuery for layout dimensions and ScreenUtil for font sizes
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final double? elevation;

  const ResponsiveAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsive layout
    final isTablet = ResponsiveHelper.isTablet(context);
    final appBarHeight = isTablet ? 80.0 : 56.0;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: isTablet ? 24.sp : 20.sp, // ScreenUtil for font size
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      toolbarHeight: appBarHeight,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
