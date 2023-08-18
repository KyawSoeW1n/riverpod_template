import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/resource/app_dimens.dart';

class TextViewWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final double? lineHeight;

  const TextViewWidget(
    this.text, {
    Key? key,
    this.textSize = AppDimens.textRegular,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.letterSpacing = 0.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
    this.maxLine = 5,
    this.lineHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.beVietnamPro(
        fontSize: textSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        height: lineHeight,
      ),
      maxLines: maxLine,
      overflow: textOverflow,
    );
  }
}
