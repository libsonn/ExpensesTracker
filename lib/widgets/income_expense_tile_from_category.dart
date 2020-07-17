import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

import '../constants.dart';

class IncomeExpenseTileFromSelectedCategory extends StatelessWidget {
  IncomeExpenseTileFromSelectedCategory({@required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;
    return Consumer<DatabaseHelper>(
      builder: (context, databaseHelper, child) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Provider.of<DatabaseHelper>(context)
                    .getListOfSelectedCategory(
                        CategoryList.getSelectedCategory())[index]
                    .getCategory()
                    .getColor()
                    .shade100),
            child: Padding(
              padding: EdgeInsets.all(screenWidth(3)),
              child: Icon(
                Provider.of<DatabaseHelper>(context)
                    .getListOfSelectedCategory(
                        CategoryList.getSelectedCategory())[index]
                    .getCategory()
                    .getIconData(),
                color: Provider.of<DatabaseHelper>(context)
                    .getListOfSelectedCategory(
                        CategoryList.getSelectedCategory())[index]
                    .getCategory()
                    .getColor(),
                size: screenWidth(5),
              ),
            ),
          ),
          title: ResponsiveTextOnWhiteWidget(
            text:
                '${databaseHelper.getListOfSelectedCategory(CategoryList.getSelectedCategory())[index].getName()}',
            fontSize: screenHeight(2),
          ),
          subtitle: ResponsiveTextOnWhiteWidget(
              fontSize: screenHeight(1.5),
              text:
                  '${dateFormat.format(databaseHelper.getListOfSelectedCategory(CategoryList.getSelectedCategory())[index].getDateTime())}'),
          trailing: ResponsiveTextOnWhiteWidget(
              selectedColor: Provider.of<DatabaseHelper>(context)
                          .getListOfIncomesExpenses()[index]
                          .getName() ==
                      'Income'
                  ? Colors.green
                  : Colors.red,
              fontSize: screenHeight(2),
              text:
                  '\$${databaseHelper.getListOfSelectedCategory(CategoryList.getSelectedCategory())[index].getAmount()}'),
        );
      },
    );
  }
}
