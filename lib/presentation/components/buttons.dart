import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color bgColor;
  final FontWeight fontWeight;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.bgColor = darkBlue,
    this.width = 200.0,
    this.height = mainButtonsSize,
    this.fontSize = mainFontSize,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(bgColor),
            backgroundColor: MaterialStateProperty.all<Color>(bgColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).w))),
        onPressed: onPressed,
        child: SizedBox(
          width: 250.w,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize.sp,
              color: textWhite,
              fontWeight: fontWeight,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  //TODO : remove secondary button - only use defaultButton
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200.0,
    this.height = mainButtonsSize,
    this.fontSize = mainFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(lightGreyButtons),
            backgroundColor: MaterialStateProperty.all<Color>(lightGreyButtons),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).w))),
        onPressed: onPressed,
        child: SizedBox(
          width: 250.w,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: mainFontWeight,
              color: darkGreen,
            ),
          ),
        ),
      ),
    );
  }
}
