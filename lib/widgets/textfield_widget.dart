import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {@required this.hintText,
      @required this.onChanged,
      @required this.keyboardType,
      @required this.next});

  final String hintText;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool next;

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Container(
      width: screenWidth(85),
      height: screenHeight(5),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        textInputAction: next ? TextInputAction.next : TextInputAction.done,
        onEditingComplete: next
            ? () => FocusScope.of(context).nextFocus()
            : () => FocusScope.of(context).unfocus(),
        cursorColor: Colors.white,
        keyboardType: keyboardType,
        decoration: InputDecoration.collapsed(
          fillColor: Colors.white,
          hoverColor: Colors.white,
          hintText: '$hintText',
        ),
        onChanged: onChanged,
      ),
    );
  }
}
