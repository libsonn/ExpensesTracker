import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat('dd-MM-yyyy');

const kBackgroundColorGradient = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [klightPurpleColor, kdarkPurpleColor]),
);

const kTextOnBackgroundColor = Colors.white;
final kTextOnWhiteColor = Colors.grey.shade900;
const kIconColor = Colors.white;
const klightPurpleColor = Color.fromARGB(255, 150, 42, 145);
const kdarkPurpleColor = Color.fromARGB(200, 110, 42, 145);
const kInactiveColor = Colors.grey;
const kActiveColor = klightPurpleColor;
