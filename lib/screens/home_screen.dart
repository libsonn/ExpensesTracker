import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/widgets/income_expense_tile_widget.dart';
import 'package:expenses_tracker/widgets/income_expense_widget.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:expenses_tracker/constants.dart';

class HomeScreen extends StatefulWidget {
  static String screenId = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Consumer<DatabaseHelper>(
      builder: (context, databaseHelper, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: backgroundColorGradient,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            screenWidth(1),
                            screenHeight(4),
                            screenWidth(1),
                            screenHeight(1),
                          ),
                          child: Column(
                            children: <Widget>[
                              ResponsiveTextOnPinkWidget(
                                text: 'CURRENT BALANCE',
                                fontSize: screenHeight(2),
                              ),
                              SizedBox(height: screenHeight(1.5)),
                              ResponsiveTextOnPinkWidget(
                                text: '\$ ${databaseHelper.getBalance()}',
                                fontSize: screenHeight(6),
                              ),
                              SizedBox(height: screenHeight(1.5)),
                              ResponsiveTextOnPinkWidget(
                                text: '${dateFormat.format(DateTime.now())}',
                                fontSize: screenHeight(2),
                              ),
                              SizedBox(height: screenHeight(2)),
                              IncomeExpenseRowWidget(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            screenWidth(0.5),
                            screenHeight(1),
                            screenWidth(0.5),
                            screenHeight(1),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.transparent,
                            ),
                            width: screenWidth(90),
                            height: screenHeight(54.4),
                            child: ListView.builder(
                              itemCount:
                                  databaseHelper.getNumberOfIncomesExpenses(),
                              itemBuilder: (BuildContext context, int index) {
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
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(screenHeight(2)),
                                        ),
                                      ),
                                      child: IncomeExpenseTile(
                                        index: index,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight(1),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
