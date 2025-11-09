import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        String userName = 'زائر';

        if (state is AuthSuccess) {
          userName = state.userModel.loginResponseDto?.user?.userName ?? 'مستخدم';
        }

        return Container(
          decoration: const BoxDecoration(),
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundImage: const AssetImage('assets/images/preson.jpg'),
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
  }
}
