import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_or_divider.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_form_fields.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_social_section.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBodyPage extends StatefulWidget {
  const SignUpBodyPage({super.key});

  @override
  State<SignUpBodyPage> createState() => _SignUpBodyPageState();
}

class _SignUpBodyPageState extends State<SignUpBodyPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  late final TextEditingController emailController;
  late final TextEditingController nameController;
  late final TextEditingController numberController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    numberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => AlertDialog(
                backgroundColor: ThemeColor.bgColor,
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 16),
                    Text("...جاري إنشاء حساب"),
                  ],
                ),
              ),
            );
          });
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          context.go(AppRouter.kLogin);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          showCustomSnackBar(
            context: context,
            message: state.message,
            backgroundColor: ThemeColor.errorColor,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SignUpHeader(),
                  SignUpFormFields(
                    controllerEmailField: emailController,
                    controllerPasswordField: passwordController,
                    controllerNameField: nameController,
                    controllerNumberField: numberController,
                  ),
                  SignUpButton(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    nameController: nameController,
                    numberController: numberController,
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isTablet = ResponsiveHelper.isTablet(context);
                      final spacing = isTablet ? 35.0 : 27.0;
                      return SizedBox(height: spacing);
                    },
                  ),
                  const LoginOrDivider(),
                  const SizedBox(height: 10),
                  const SignUpSocialSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
