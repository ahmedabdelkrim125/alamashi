import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          width: 343.w,
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'تأكيد تسجيل الخروج',
                textAlign: TextAlign.center,
                style: Style.textStyle14.copyWith(
                  fontSize: 18.sp,
                  fontFamily: cairoSemiBold,
                  color: ThemeColor.textColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'هل أنت متأكد أنك تريد تسجيل الخروج',
                textAlign: TextAlign.center,
                style: Style.textStyle14.copyWith(
                  fontFamily: cairoRegular,
                  color: ThemeColor.graniteGray,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                spacing: 8.w,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: ThemeColor.logoutRed,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'إلغاء',
                            style: Style.textStyle14.copyWith(
                              fontFamily: cairoSemiBold,
                              color: ThemeColor.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.read<AuthCubit>().logout();
                        context.go(AppRouter.kLogin);
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: ThemeColor.logoutRed,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            'تسجيل الخروج',
                            style: Style.textStyle14.copyWith(
                              fontFamily: cairoSemiBold,
                              color: ThemeColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
