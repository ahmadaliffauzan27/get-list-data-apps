import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';

extension SetFontWeight on TextStyle {
  TextStyle get regular => AppTextStyle.setRegular(this);
  TextStyle get medium => AppTextStyle.setMedium(this);
  TextStyle get semiBold => AppTextStyle.setSemiBold(this);
  TextStyle get bold => AppTextStyle.setBold(this);
}
