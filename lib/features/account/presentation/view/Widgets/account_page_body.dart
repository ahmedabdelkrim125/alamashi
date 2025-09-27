import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/custom_app_bar_account.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/logout_dialog.dart';
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
      shrinkWrap: true,
      children: [
        CustomAppBarAccount(),
        ImageProfile(),
        ProfileListItem(
          svgPicture: Assets.useraccount,
          text: 'تعديل البيانات ',
        ),
        ProfileListItem(
          svgPicture: Assets.messages,
          text: 'الرسائل',
        ),
        ProfileListItem(
          svgPicture: Assets.favourite,
          text: 'المفضله',
        ),
        ProfileListItem(
          svgPicture: Assets.notification01,
          text: 'الإشعارات',
        ),
        ProfileListItem(
          svgPicture: Assets.helpsquare,
          text: 'المساعده',
        ),
        ProfileListItem(
          svgPicture: Assets.informationdiamond,
          text: 'من نحن',
        ),
        ProfileListItem(
          svgPicture: Assets.global,
          text: 'اللغه',
        ),
        ProfileListItem(
          svgPicture: Assets.group,
          text: 'تسجيل الخروج',
          onTap: () {
            showLogoutDialog(context);
          },
        ),
       
      ],
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem(
      {super.key, required this.text, required this.svgPicture, this.onTap});
  final String text;
  final String svgPicture;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.w,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 400.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: ThemeColor.lightGreenBackground,
              borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SvgPicture.asset(
                  Assets.back,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  spacing: 6.w,
                  children: [
                    Text(
                      text,
                      style: Style.textStyle18.copyWith(
                        fontFamily: cairoRegular,
                      ),
                    ),
                    Image.asset(
                      svgPicture,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80.r,
            backgroundImage: AssetImage('assets/images/preson.jpg'),
          ),
          Text(
            'احمد عبدالكريم',
            style: Style.textStyle14.copyWith(
              fontFamily: cairoBold,
            ),
          ),
        ],
      ),
    );
  }
}
