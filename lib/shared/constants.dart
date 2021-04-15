import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kButtonTextStyle = GoogleFonts.roboto(fontSize: 30.0);
final kTempTextStyle = GoogleFonts.roboto(fontSize: 100.0);

final kMessageTextStyle = GoogleFonts.lato(fontSize: 50.0);
final kConditionTextStyle = GoogleFonts.lato(fontSize: 100.0);

const int K = 273;

const kPrimaryColor = Color(0xFFFF97B3);
const kSecondaryLightColor = Color(0xFFE4E9F2);
const kSecondaryDarkColor = Color(0xFF404040);
const kAccentLightColor = Color(0xFFB3BFD7);
const kAccentDarkColor = Color(0xFF4E4E4E);
const kBackgroundDarkColor = Color(0xFF3A3A3A);
const kSurfaceDarkColor = Color(0xFF222225);
// Icon Colors
const kAccentIconLightColor = Color(0xFFECEFF5);
const kAccentIconDarkColor = Color(0xFF303030);
const kPrimaryIconLightColor = Color(0xFFECEFF5);
const kPrimaryIconDarkColor = Color(0xFF232323);
// Text Colors
const kBodyTextColorLight = Color(0xFFA1B0CA);
const kBodyTextColorDark = Color(0xFF7C7C7C);
const kTitleTextLightColor = Color(0xFF101112);
const kTitleTextDarkColor = Colors.white;

//Shadow color
const kShadowColor = Color(0xFF364564);

const Duration kAnimationDuration = Duration(milliseconds: 200);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFFA53E),
    Color(0xffFF7643),
  ],
);

//INPUTS
final TextStyle kHeadingStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
final InputDecoration kOtpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: 15,
  ),
  enabledBorder: _outlineInputBorder(),
  focusedBorder: _outlineInputBorder(),
  border: _outlineInputBorder(),
);
OutlineInputBorder _outlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.black),
    );
