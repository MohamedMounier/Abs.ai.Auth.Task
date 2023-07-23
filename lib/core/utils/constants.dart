import 'package:flutter/material.dart';

const textWhite = Color(0xFFFFFFFF);
const lightGreyButtons = Color(0xFFE9E9E8);
const darkGreen = Color(0xFF395A64);
const textBlack = Color(0xFF000000);
const darkBlue = Color(0xFF061C57);
const lightGreyReceiptBG = Color(0xFFACB4CC);



const mainButtonsSize = 60.0;

const mainFontSize = 25.0;
const FontWeight mainFontWeight = FontWeight.bold;

const subFontSize = 21.0;
const FontWeight subFontWeight = FontWeight.bold;

const commonTextSize = 18.0;
const FontWeight commonTextWeight =
    FontWeight.w700;


GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

displaySnackBar(String text) {
  scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    content: Text(text),
  ));
}


