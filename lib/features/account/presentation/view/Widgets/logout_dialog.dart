import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = ResponsiveHelper.isTablet(context);
            final dialogWidth = isTablet ? 400.0 : 343.0;
            final verticalPadding = isTablet ? 32.0 : 24.0;
            final horizontalPadding = isTablet ? 24.0 : 16.0;

            return Container(
              width: dialogWidth,
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تأكيد تسجيل الخروج',
                    textAlign: TextAlign.center,
                    style: Style.textStyle14.copyWith(
                      fontSize: 18,
                      fontFamily: cairoSemiBold,
                      color: ThemeColor.textColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'هل أنت متأكد أنك تريد تسجيل الخروج',
                    textAlign: TextAlign.center,
                    style: Style.textStyle14.copyWith(
                      fontFamily: cairoRegular,
                      color: ThemeColor.graniteGray,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
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
                      SizedBox(width: 8),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.read<AuthCubit>().logout();
                            context.go(AppRouter.kLogin);
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: ThemeColor.logoutRed,
                              borderRadius: BorderRadius.circular(8),
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
            );
          },
        ),
      );
    },
  );
}
