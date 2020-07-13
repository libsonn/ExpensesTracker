import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:expenses_tracker/constants.dart';

class IncomeExpenseRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Consumer<DatabaseHelper>(
      builder: (context, databaseHelper, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade700,
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: Offset(0, 1.5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight(0.5)),
                    child: Icon(
                      FontAwesomeIcons.arrowUp,
                      color: Colors.green,
                      size: screenHeight(2.5),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth(3),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'INCOMES',
                      style: TextStyle(
                          color: kTextOnBackgroundColor,
                          fontSize: screenHeight(3)),
                    ),
                    Text(
                      '\$${databaseHelper.getAmountOfIncomes()}',
                      style: TextStyle(
                          color: kTextOnBackgroundColor,
                          fontSize: screenHeight(4)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade700,
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 1.5),
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight(0.5)),
                    child: Icon(
                      FontAwesomeIcons.arrowDown,
                      color: Colors.red,
                      size: screenHeight(2.5),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth(3),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'EXPENSES',
                      style: TextStyle(
                          color: kTextOnBackgroundColor,
                          fontSize: screenHeight(3)),
                    ),
                    Text(
                      '\$${databaseHelper.getAmountOfExpenses()}',
                      style: TextStyle(
                          color: kTextOnBackgroundColor,
                          fontSize: screenHeight(4)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
