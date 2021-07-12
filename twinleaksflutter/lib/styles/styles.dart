import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:twinleaksflutter/styles/dimes.dart';
import 'colors.dart';

class TwinLeaksTheme {
  static ThemeData getTheme(bool isDarkMode) {
    return ThemeData(
      fontFamily: "DINPro",
      dialogBackgroundColor: isDarkMode ? Colours.dark_bg_color : Colours.bg_color,
      errorColor: isDarkMode ? Colours.dark_red : Colours.red,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      accentColor: isDarkMode ? Colours.green : Colours.green,
      indicatorColor: isDarkMode ? Colours.green : Colours.green,
      disabledColor: isDarkMode ? Colours.text_gray : Colours.text_gray_c,
      cardColor: isDarkMode ? Colours.dark_material_bg : Colours.bg_color,
      scaffoldBackgroundColor:
          isDarkMode ? Colours.dark_bg_color : Colours.bg_color,
      canvasColor: isDarkMode ? Colours.dark_bg_color : Colors.white,
      textSelectionColor: Colours.app_main.withAlpha(70),
      textSelectionHandleColor: Colours.app_main,
      textTheme: TextTheme(
          button: TextStyles.text20medium.apply(
            color: Colours.text,
          ),
          // subtitle1:
          //     isDarkMode ? TextStyles.textGray14 : TextStyles.textDarkGray14,

          subtitle1: TextStyles.text12
              .apply(color: isDarkMode ? Colours.dark_text : Colours.text),
          bodyText1: isDarkMode ? TextStyles.textDark : TextStyles.text,
          bodyText2: isDarkMode ? TextStyles.text14 : TextStyles.text12,
          subtitle2: TextStyles.text14
              .apply(color: isDarkMode ? Colours.dark_text : Colours.text),
          // headline1: TextStyles.textBold14
          //     .apply(color: isDarkMode ? Colours.dark_text : Colours.text),
          headline1: TextStyles.text18
              .apply(color: isDarkMode ? Colors.white : Colours.text),
          headline2: TextStyles.text20
              .apply(color: isDarkMode ? Colors.white : Colours.text),
          headline3: TextStyles.text18
              .apply(color: isDarkMode ? Colours.dark_text : Colours.text),
          headline4: TextStyles.textBold24
              .apply(color: isDarkMode ? Colours.dark_text : Colours.text)),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkMode ? Colours.dark_bg_color : Colours.bg_color,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        iconTheme:
            IconThemeData(color: isDarkMode ? Colors.white : Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkMode ? Colours.dark_bg_color : Colours.bg_color,
        elevation: 0.0,
        selectedItemColor: Colours.green,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: DividerThemeData(
          color: isDarkMode ? Colours.dark_line : Colours.line,
          space: 0.6,
          thickness: 0.6),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      //   pageTransitionsTheme: NoTransitionsOnWeb(),
    );
  }
}

class TextStyles {
  static const TextStyle text18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

  static const TextStyle text20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  static const TextStyle text20medium =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  static const TextStyle text12 =
      TextStyle(fontSize: 12, fontWeight: FontWeight.normal);

  static const TextStyle text14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle buttonText16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static const TextStyle textSize12 = TextStyle(
    fontSize: Dimens.font_sp12,
  );
  static const TextStyle textSize16 = TextStyle(
    fontSize: Dimens.font_sp16,
  );
  static const TextStyle textBold14 =
      TextStyle(fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold);
  static const TextStyle textBold16 =
      TextStyle(fontSize: Dimens.font_sp16, fontWeight: FontWeight.bold);
  static const TextStyle textBold18 =
      TextStyle(fontSize: Dimens.font_sp18, fontWeight: FontWeight.bold);
  static const TextStyle textBold24 =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  static const TextStyle textBold26 =
      TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold);

  static const TextStyle textGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static const TextStyle textDarkGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_text_gray,
  );

  static const TextStyle textWhite14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colors.white,
  );

  static const TextStyle text = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text,
      textBaseline: TextBaseline.alphabetic);
  static const TextStyle textDark = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.dark_text,
      textBaseline: TextBaseline.alphabetic);

  // static const TextStyle text12 = TextStyle(
  //     fontSize: Dimens.font_sp12,
  //     color: Colours.text,
  //     textBaseline: TextBaseline.alphabetic);
  static const TextStyle textDark12 = TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.dark_text,
      textBaseline: TextBaseline.alphabetic);

  static const TextStyle textGray12 = TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.text_gray,
      fontWeight: FontWeight.normal);
  static const TextStyle textDarkGray12 = TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.dark_text_gray,
      fontWeight: FontWeight.normal);

  static const TextStyle textHint14 =
      TextStyle(fontSize: Dimens.font_sp14, color: Colours.dark_text_disabled);
}
