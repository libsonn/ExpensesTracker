import 'package:expenses_tracker/widgets/categories_charts_widgets.dart';
import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

import '../constants.dart';

class ChartsScreen extends StatefulWidget {
  static String id = '/chartsScreen';
  //TODO add chart of dates of incomes/expenses
  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Consumer<DatabaseHelper>(
      builder: (context, databaseHelper, child) {
        return Scaffold(
          resizeToAvoidBottomPadding: true,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Container(
              width: screenWidth(100),
              height: screenHeight(100),
              decoration: kBackgroundColorGradient,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(2),
                  horizontal: screenWidth(3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        screenWidth(1),
                        screenHeight(4),
                        screenWidth(1),
                        screenHeight(1),
                      ),
                      child: SizedBox(
                        height: screenHeight(70),
                        child: ListView(
                          children: <Widget>[
                            ResponsiveTextOnPinkWidget(
                              text: 'Charts',
                              fontSize: screenHeight(5.5),
                            ),
                            SizedBox(
                              height: screenHeight(2),
                            ),
                            ResponsiveTextOnPinkWidget(
                              text: 'Bar chart of incomes and expenses',
                              fontSize: screenHeight(3),
                            ),
                            Container(
                              height: screenHeight(0.1),
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: screenHeight(2),
                            ),
                            CategoriesBarChart(),
                            SizedBox(
                              height: screenHeight(2),
                            ),
                            ResponsiveTextOnPinkWidget(
                              text: 'Ratio of incomes and expenses',
                              fontSize: screenHeight(3),
                            ),
                            Container(
                              height: screenHeight(0.1),
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: screenHeight(2),
                            ),
                            CategoriesPieChart(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
