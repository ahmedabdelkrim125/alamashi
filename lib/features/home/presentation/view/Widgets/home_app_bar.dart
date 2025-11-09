// home_app_bar.dart
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        String userName = 'زائر';

        if (state is AuthSuccess) {
          userName = state.userModel.loginResponseDto?.user?.userName ?? 'مستخدم';
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 16.w),
              onPressed: () {
                context.push(AppRouter.kShoppingCartPage);
              },
              icon: SvgPicture.asset(
                Assets.shoppingCartIcon,
                width: 24.w,
                height: 24.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                spacing: 6,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'مرحباً',
                        style: Style.textStyle12.copyWith(
                          fontFamily: cairoMedium,
                          color: ThemeColor.darkMauve,
                        ),
                      ),
                      Text(
                        userName,
                        style: Style.textStyle14.copyWith(
                          fontFamily: cairoRegular,
                          color: ThemeColor.textColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/220364408?s=400&u=75e040eb362ce448eace0b341954a7121d421f14&v=4',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
