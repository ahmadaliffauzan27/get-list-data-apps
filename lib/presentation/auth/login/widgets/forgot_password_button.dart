import 'package:aplikasi_sederhana/common/components/font_weight.dart';
import 'package:aplikasi_sederhana/common/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/app_text_style.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Lupa Kata Sandi?",
        style: AppTextStyle.body3.medium.copyWith(color: PrimaryColor.pr05),
        textAlign: TextAlign.end,
      ),
    );
  }
}
