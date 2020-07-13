import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class BottomButtonWidget extends StatelessWidget {
  BottomButtonWidget(
      {@required this.text, @required this.onTap, @required this.iconData});

  final String text;
  final Function onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: screenWidth(100),
            height: screenHeight(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: klightPurpleColor,
                ),
                SizedBox(
                  width: screenWidth(2),
                ),
                ResponsiveTextOnWhiteWidget(
                  selectedColor: klightPurpleColor,
                  text: '$text',
                  fontSize: screenHeight(4),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenHeight(3),
        )
      ],
    );
  }
}
