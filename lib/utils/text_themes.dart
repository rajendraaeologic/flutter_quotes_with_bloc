import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils.dart';

class TextThemes {
  static late TextTheme _textTheme;
  static TextStyle? h11 = _textTheme.headline1;
  static TextStyle? h12 = _textTheme.headline2;
  static TextStyle? h14 = _textTheme.headline3;
  static TextStyle? h16 = _textTheme.headline4;
  static TextStyle? h18 = _textTheme.headline5;
  static TextStyle? h20 = _textTheme.headline6;
  static TextStyle? h24 = _textTheme.bodyText1;
  static TextStyle? h30 = _textTheme.bodyText2;
  static TextStyle? h32 = _textTheme.overline;

  TextThemes(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
  }

  static TextStyle? h11Extended() {
    return TextThemes.h11?.copyWith(
      color: Utils.generateColors(),
      fontSize: ScreenUtil().setSp(16),
      fontWeight: FontWeight.w500,
    );
  }
}

extension TextThemeExtension on TextTheme {
  TextStyle? h1() {
    return headline1;
  }

  TextStyle? h2() {
    return headline2;
  }

  TextStyle? h3() {
    return headline3;
  }

  TextStyle? h4() {
    return headline4;
  }

  TextStyle? h5() {
    return headline5;
  }

  TextStyle? h6() {
    return headline6;
  }
}
