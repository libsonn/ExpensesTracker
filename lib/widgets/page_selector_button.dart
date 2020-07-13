import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class PageSelectorButton extends StatelessWidget {
  PageSelectorButton(
      {@required this.icon,
      @required this.text,
      @required this.onTap,
      @required this.isSelected});

  final Function onTap;
  final IconData icon;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Function screenHeight = Screen(context).hp;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? kActiveColor : kInactiveColor,
            ),
            ResponsiveTextOnWhiteWidget(
              selectedColor: isSelected ? kActiveColor : kInactiveColor,
              text: '$text',
              fontSize: screenHeight(2),
            )
          ],
        ),
      ),
    );
  }
}
