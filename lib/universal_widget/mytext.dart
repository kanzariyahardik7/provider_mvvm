import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextOverflow? textoverflow;
  final int? maxlines;
  final TextAlign? textalign;
  final double? fontsize;
  final Color? color;
  final FontWeight? fontweight;
  final FontStyle? fontstyle;
  final bool? multilanguage;

  const MyText(
      {required this.text,
      this.textoverflow,
      this.maxlines,
      this.textalign,
      this.fontsize,
      this.color,
      this.fontweight,
      this.fontstyle,
      this.multilanguage,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (multilanguage == true) {
      return LocaleText(text,
          overflow: textoverflow,
          maxLines: maxlines,
          textAlign: textalign,
          style: GoogleFonts.inter(
            fontSize: fontsize,
            color: color,
            fontWeight: fontweight,
            fontStyle: fontstyle,
          ));
    } else {
      return Text(text,
          overflow: textoverflow,
          maxLines: maxlines,
          textAlign: textalign,
          style: GoogleFonts.inter(
            fontSize: fontsize,
            color: color,
            fontWeight: fontweight,
            fontStyle: fontstyle,
          ));
    }
  }
}
