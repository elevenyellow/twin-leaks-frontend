import 'package:flutter/material.dart';

class Colours {
  static const Color app_main = Color(0xFF4688FA);
  static const Color dark_app_main = Color(0xFF3F7AE0);
  static const Color white_light = Colors.white70;
  static const Color yellow = Color(0xFFFBC02C);
  static const Color fomo = Color(0xFFFF007A);
  static const Color aave_purple = Color(0xFFB6509E);
  static const Color aave_blue = Color(0xFF2EBAC6);
  static const Color aave_orange = Color(0xFFFF7601);
  static const Color twin_leaks_purple = Color(0xFF6D60F8);

  static const Color bg_color = Color(0xFFF0F4F6); //edited by avyact
  static const Color dark_bg_color = Color(0xFF0F1212); //edited by avyact
  // static const Color dark_bg_color = Color(0xFF1F2124);

  static const Color material_bg = Color(0xFFFFFFFF);
  static const Color dark_material_bg = Color(0xFF353739);

  // static const Color text = Color(0xFF1F2124);
  static const Color text = Color(0xFF666666); //edited by avyact
  static const Color dark_text = Color(0xFFACAFB0); //edited by avyact

  static const Color text_gray = Color(0xFFACAFB0); //edited by avyact
  static const Color dark_text_gray = Color(0xFF666666);

  static const Color text_gray_c = Color(0xFFcccccc);
  static const Color dark_button_text = Color(0xFFF2F2F2);

  static const Color bg_gray = Color(0xFFF6F6F6);
  static const Color dark_bg_gray = Color(0xFF1F1F1F);

  static const Color line = Color(0xFFEEEEEE);
  static const Color dark_line = Color(0xFF3A3C3D);

  static const Color red = Color(0xFFFF5000); //edited by avyact
  static const Color dark_red = Color(0xFFb7002b);

  static const Color green = Color(0xFF03C805); //edited by avyact
  // static const Color green = Color(0xFF009000);

  static const Color dark_green = Color(0xFF128d53);

  static const Color text_disabled = Color(0xFFC2C5C6);
  static const Color dark_text_disabled = Color(0xFFC2C5C6);

  static const Color button_disabled = Color(0xFF96BBFA);
  static const Color dark_button_disabled = Color(0xFF83A5E0);

  static const Color unselected_item_color = Color(0xffbfbfbf);
  static const Color dark_unselected_item_color = Color(0xFF4D4D4D);

  static const Color bg_gray_ = Color(0xFFFAFAFA);
  static const Color dark_bg_gray_ = Color(0xFF242526);

  static const LinearGradient greenGradient =
      LinearGradient(colors: [green, dark_green]);
  static const LinearGradient redGradient =
      LinearGradient(colors: [red, dark_red]);
  static const Gradient purpleGradient = LinearGradient(
      colors: [aave_blue, aave_purple],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
}

final Shader linearGradient =
    Colours.purpleGradient.createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
