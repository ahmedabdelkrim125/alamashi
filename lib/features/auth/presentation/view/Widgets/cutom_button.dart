import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';

class CutomBuutton extends StatelessWidget {
  const CutomBuutton({super.key, required this.textButton, this.onTap});
  final String textButton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: ThemeColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              textButton,
              style: Style.textStyle18.copyWith(
                fontFamily: cairoSemiBold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
