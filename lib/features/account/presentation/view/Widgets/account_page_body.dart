import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/custom_app_bar_account.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/image_profile.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/logout_dialog.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/profile_list_item.dart';
import 'package:flutter/material.dart';


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


