import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class IncomeExpenseTile extends StatelessWidget {
  IncomeExpenseTile({@required this.index});

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
              color: CategoryList.getCategoryFromName(databaseHelper
                      .getListOfIncomesExpenses()[index]
                      .getCategoryName())
                  .getColor()
                  .shade100,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth(3)),
              child: Icon(
                CategoryList.getCategoryFromName(databaseHelper
                        .getListOfIncomesExpenses()[index]
                        .getCategoryName())
                    .getIconData(),
                color: CategoryList.getCategoryFromName(databaseHelper
                        .getListOfIncomesExpenses()[index]
                        .getCategoryName())
                    .getColor(),
                size: screenWidth(5),
              ),
            ),
          ),
          title: ResponsiveTextOnWhiteWidget(
              fontSize: screenHeight(2),
              text:
                  '${databaseHelper.getListOfIncomesExpenses()[index].getName().toUpperCase()}'),
          subtitle: ResponsiveTextOnWhiteWidget(
              fontSize: screenHeight(1.5),
              text:
                  '${dateFormat.format(databaseHelper.getListOfIncomesExpenses()[index].getDateTime())}'),
          trailing: ResponsiveTextOnWhiteWidget(
              selectedColor: CategoryList.getCategoryFromName(databaseHelper
                              .getListOfIncomesExpenses()[index]
                              .getCategoryName())
                          .getText() ==
                      'Income'
                  ? Colors.green
                  : Colors.red,
              fontSize: screenHeight(2),
              text:
                  '\$${databaseHelper.getListOfIncomesExpenses()[index].getAmount()}'),
        );
      },
    );
  }
}
