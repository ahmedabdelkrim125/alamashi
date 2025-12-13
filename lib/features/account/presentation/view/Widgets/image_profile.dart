import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final spacing = isTablet ? 25.0 : 16.0;
        final radius = isTablet ? 100.0 : 80.0;

        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            String userName = 'زائر';

            if (state is AuthSuccess) {
              userName =
                  state.userModel.loginResponseDto?.user?.userName ?? 'مستخدم';
            }

            return Container(
              decoration: const BoxDecoration(),
              child: Column(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: radius,
                    backgroundImage: const AssetImage(
                      'assets/images/preson.jpg',
                    ),
                  ),
                  Text(
                    userName,
                    style: Style.textStyle18.copyWith(fontFamily: cairoBold),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
