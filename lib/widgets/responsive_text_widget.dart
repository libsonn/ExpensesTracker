import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class ResponsiveTextOnPinkWidget extends StatelessWidget {
  ResponsiveTextOnPinkWidget(
      {@required this.fontSize, @required this.text, this.link});

  final String text;
  final double fontSize;
  final bool link;

  @override
  Widget build(BuildContext context) {
    return link == true
        ? Text(
            '$text',
            style: GoogleFonts.lato(
              color: Colors.blue,
              fontSize: fontSize,
              decoration: TextDecoration.underline,
            ),
          )
        : Text(
            '$text',
            style: GoogleFonts.lato(
              color: kTextOnBackgroundColor,
              fontSize: fontSize,
            ),
          );
  }
}

class ResponsiveTextOnWhiteWidget extends StatelessWidget {
  ResponsiveTextOnWhiteWidget(
      {@required this.fontSize, @required this.text, this.selectedColor});

  final String text;
  final double fontSize;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return selectedColor != null
        ? Text(
            '$text',
            style: GoogleFonts.lato(color: selectedColor, fontSize: fontSize),
          )
        : Text(
            '$text',
            style:
                GoogleFonts.lato(color: kTextOnWhiteColor, fontSize: fontSize),
          );
  }
}
