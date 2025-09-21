import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/custom_app_bar_account.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBarAccount(),
        // ProfileListItem(),
        // ProfileListItem(),
        // ProfileListItem(),
        // ImageProfile(),
        IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              context.go(AppRouter.kLogin);
            },
            icon: Icon(Icons.logout))
      ],
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        width: 343.w,
        height: 48.h,
        decoration: BoxDecoration(
            color: ThemeColor.lightGreenBackground,
            borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.back,
            ),
            Row(
              spacing: 6.w,
              children: [
                Text(
                  'الرسائل',
                  style: Style.textStyle14.copyWith(
                    fontFamily: cairoRegular,
                  ),
                ),
                SvgPicture.asset(
                  Assets.ahmed,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
