import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/widgets/category_tile_widget.dart';
import 'package:expenses_tracker/widgets/income_expense_tile_from_category.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:expenses_tracker/constants.dart';

class CategoriesScreen extends StatefulWidget {
  static String id = '/categoriesScreen';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Consumer<DatabaseHelper>(
      builder: (context, databaseHelper, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: screenHeight(100),
              width: screenWidth(100),
              decoration: kBackgroundColorGradient,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight(4),
                              horizontal: screenWidth(3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResponsiveTextOnPinkWidget(
                                text: 'Select category to get more info',
                                fontSize: screenHeight(3),
                              ),
                              SizedBox(
                                height: screenHeight(1),
                              ),
                              Container(
                                color: Colors.transparent,
                                width: screenWidth(90),
                                height: screenHeight(30),
                                child: ListView.builder(
                                  itemCount:
                                      CategoryList.getNumberOfCategories(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Provider.of<DatabaseHelper>(context,
                                                  listen: false)
                                              .switchSelectedCategory(index);
                                        });
                                      },
                                      child: CategoryTileWidget(
                                        category: CategoryList
                                            .getCategoriesList()[index],
                                        isSelected: CategoryList
                                                .getCategoriesList()[index]
                                            .getSelected(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(1),
                              ),
                              CategoryList.getSelectedCategory().getText() ==
                                      'Income'
                                  ? ResponsiveTextOnPinkWidget(
                                      text:
                                          'Total amount of incomes: ${databaseHelper.getAmountOfIncomes()}'
                                              .toUpperCase()
                                              .toUpperCase(),
                                      fontSize: screenHeight(2),
                                    )
                                  : ResponsiveTextOnPinkWidget(
                                      text:
                                          'Total amount of \$ spent on ${CategoryList.getSelectedCategory().getText()}: ${databaseHelper.getAmountOfCategory(CategoryList.getSelectedCategory())}'
                                              .toUpperCase(),
                                      fontSize: screenHeight(2),
                                    ),
                              SizedBox(
                                height: screenHeight(1),
                              ),
                              Container(
                                color: Colors.transparent,
                                width: screenWidth(90),
                                height: screenHeight(30),
                                child: ListView.builder(
                                  itemCount: databaseHelper
                                      .getNumberOfSelectedCategory(
                                          CategoryList.getSelectedCategory()),
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                          child:
                                              IncomeExpenseTileFromSelectedCategory(
                                                  index: index),
                                        ),
                                        SizedBox(
                                          height: screenHeight(1),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
