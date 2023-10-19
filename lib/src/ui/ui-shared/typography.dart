part of com.pokedex_app.ui_shared;

class TypoBase {
  static TextStyle get robotoBold => GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );

  static TextStyle get robotoSemiBold => GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get robotoMedium => GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );

  static TextStyle get robotoRegular => GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );
}

class DisplayTextStyle {
  static TextStyle display3 = TypoBase.robotoMedium.copyWith(
    fontSize: 40,
  );
  static TextStyle display2 = TypoBase.robotoBold.copyWith(
    fontSize: 32,
  );
  static TextStyle display1 = TypoBase.robotoSemiBold.copyWith(
    fontSize: 28,
  );
}

class BodyTextStyle {
  static TextStyle body1 = TypoBase.robotoRegular.copyWith(
    fontSize: 16,
  );
  static TextStyle body2 = TypoBase.robotoRegular.copyWith(
    fontSize: 14,
  );
}
