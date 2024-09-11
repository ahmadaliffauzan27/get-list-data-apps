import 'package:aplikasi_sederhana/common/constants/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Belum Punya Akun? ',
            style: TextStyle(color: NeutralColor.ne04),
          ),
          TextSpan(
            text: 'Daftar',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                FocusScope.of(context).unfocus();

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const RegisterPage()));
              },
            style: const TextStyle(color: PrimaryColor.pr05),
          ),
        ],
        style: AppTextStyle.body3,
      ),
      textAlign: TextAlign.center,
    );
  }
}
