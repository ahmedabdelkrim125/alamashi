// إضافة validation لما تضغط على تسجيل دخول أو إنشاء حساب
// - عشان تضيف validation:
//     - لازم تلف الـ Column اللي في LoginPageBody بـ Form widget وعامله key.
//     - في CutomBuutton، تضيف check للـ validation باستخدام الـ key بتاع الفورم.

// تعديل الكود

// import 'package:egyptian_supermaekat/core/app_router.dart';
// import 'package:egyptian_supermaekat/core/assets.dart';
// import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';
// import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_button.dart';
// import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_forget_text.dart';
// import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/social_login_button.dart';
// import 'package:flutter/material.dart';

// class LoginPageBody extends StatelessWidget {
//   LoginPageBody({super.key});

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             FittedBox(
//               child: Image.asset(
//                 Assets.logo,
//                 height: 80,
//                 width: 80,
//               ),
//             ),
//             CustomFormTextField(
//               textLable: 'البريد الالكتروني',
//               texthit: 'البريد الالكتروني',
//             ),
//             CustomFormTextField(
//               textLable: 'كلمة السر',
//               texthit: 'كلمة السر',
//             ),
//             CutomBuutton(
//               onTap: () {
//                 if (_formKey.currentState!.validate()) {
//                   // نفذ الإجراء لو الفورم valid
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Processing Data')),
//                   );
//                 }
//               },
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: CutomForgetText(
//                 textline: 'نسيت كلمة المرور؟',
//               ),
//             ),
//             SocialLoginButton(
//               routerPage: AppRouter.signUp,
//               createAccountText: 'انشاء',
//               noAccountText: 'ليس لديك حساب؟',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // تعديل CutomBuutton عشان يقبل onTap
// import 'dart:developer';
// import 'package:egyptian_supermaekat/constant.dart';
// import 'package:egyptian_supermaekat/core/style.dart';
// import 'package:egyptian_supermaekat/core/theme_color.dart';
// import 'package:flutter/material.dart';

// class CutomBuutton extends StatelessWidget {
//   const CutomBuutton({super.key, this.onTap});
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: GestureDetector(
//         onTap: onTap ??
//             () {
//               log('Button ture');
//             },
//         child: Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             color: ThemeColor.primaryColor,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Center(
//             child: Text(
//               'تسجيل الدخول',
//               style: Style.textStyle18.copyWith(
//                 fontFamily: cairoSemiBold,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// ملاحظات
// - ضيفت Form widget مع _formKey.
// - عدلت CutomBuutton عشان يقبل onTap callback.
// - في onTap بتاع CutomBuutton، بيحصل check للـ validation باستخدام _formKey.

// عايز أي تعديلات تانية أو مساعدة بخصوص validation أو أي حاجة تانية؟