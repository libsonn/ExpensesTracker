import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

List<charts.Series<Category, String>> getData(var context) {
  final List<Category> data = CategoryList.categoriesList;
  List<charts.Series<Category, String>> series = [
    charts.Series(
      colorFn: (Category category, _) =>
          charts.ColorUtil.fromDartColor(category.getColor()),
      id: 'Categories',
      data: data,
      domainFn: (Category category, _) => category.getText(),
      measureFn: (Category category, _) =>
          Provider.of<DatabaseHelper>(context, listen: false)
              .getAmountOfCategory(category),
    ),
  ];
  return series;
}

class CategoriesBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Provider.of<DatabaseHelper>(context, listen: false)
            .getListOfIncomesExpenses()
            .isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Colors.white,
            ),
            width: screenWidth(90),
            height: screenHeight(75),
            child: charts.BarChart(
              getData(context),
              animate: true,
              vertical: false,
              animationDuration: Duration(seconds: 1),
              domainAxis: new charts.OrdinalAxisSpec(
                showAxisLine: true,
                renderSpec: new charts.NoneRenderSpec(),
              ),
              barRendererDecorator: charts.BarLabelDecorator(
                  labelPadding: 2, labelPosition: charts.BarLabelPosition.auto),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Colors.white,
            ),
            width: screenWidth(50),
            height: screenHeight(55),
            child: Center(
              child: Text(
                'NO DATA ABOUT INCOMES AND EXPENSES',
                style: TextStyle(fontSize: 10.0, color: kdarkPurpleColor),
              ),
            ),
          );
  }
}

class CategoriesPieChart extends StatelessWidget {
  final List<Category> data = CategoryList.categoriesList;

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Provider.of<DatabaseHelper>(context, listen: false)
            .getListOfIncomesExpenses()
            .isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Colors.white,
            ),
            width: screenWidth(50),
            height: screenHeight(55),
            child: charts.PieChart(
              getData(context),
              animate: true,
              animationDuration: Duration(seconds: 1),
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 120,
                arcRendererDecorators: [
                  charts.ArcLabelDecorator(),
                ],
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Colors.white,
            ),
            width: screenWidth(50),
            height: screenHeight(55),
            child: Center(
              child: Text(
                'NO DATA ABOUT INCOMES AND EXPENSES',
                style: TextStyle(fontSize: 10.0, color: kdarkPurpleColor),
              ),
            ),
          );
  }
}
