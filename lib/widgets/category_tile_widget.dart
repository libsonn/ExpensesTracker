import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class CategoryTileWidget extends StatelessWidget {
  CategoryTileWidget({@required this.category, @required this.isSelected});

  final Category category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kTextOnWhiteColor,
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            color: isSelected ? Colors.grey.shade300 : Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(screenHeight(2)),
            ),
          ),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: category.getColor().shade100),
              child: Padding(
                padding: EdgeInsets.all(screenWidth(3)),
                child: Icon(
                  category.getIconData(),
                  color: category.getColor(),
                  size: screenWidth(5),
                ),
              ),
            ),
            title: ResponsiveTextOnWhiteWidget(
                fontSize: screenHeight(2), text: '${category.getText()}'),
          ),
        ),
        SizedBox(
          height: screenHeight(0.9),
        )
      ],
    );
  }
}
