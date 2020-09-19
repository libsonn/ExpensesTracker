import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/classes/income_expense_class.dart';
import 'package:expenses_tracker/widgets/bottom_button_widget.dart';
import 'package:expenses_tracker/widgets/category_tile_widget.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:expenses_tracker/widgets/textfield_widget.dart';

import '../constants.dart';

class NewIncomeExpenseScreen extends StatefulWidget {
  static String id = '/new_income_expense_screen';

  @override
  _NewIncomeExpenseScreenState createState() => _NewIncomeExpenseScreenState();
}

class _NewIncomeExpenseScreenState extends State<NewIncomeExpenseScreen> {
  Category _categoryOfExpense;
  String _nameOfExpense;
  double _costOfExpense;
  DateTime _dateOfExpense;

  // ignore: unused_field
  Category _categoryOfIncome;
  String _nameOfIncome;
  double _amountOfIncome;
  DateTime _dateOfIncome;

  @override
  void initState() {
    super.initState();
    for (Category category in CategoryList.categoriesList) {
      category.setSelected(false);
    }
    _categoryOfExpense = CategoryList.getCategoryFromLast(1);
    _nameOfExpense = 'Expense';
    _costOfExpense = 0;
    _dateOfExpense = DateTime.now();

    _categoryOfIncome = CategoryList.getCategoryFromLast(0);
    _nameOfIncome = 'Income';
    _amountOfIncome = 0;
    _dateOfIncome = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    final _controller = ScrollController();

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: screenWidth(100),
          height: screenHeight(100),
          decoration: kBackgroundColorGradient,
          child: ListView(
            shrinkWrap: true,
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: screenWidth(95),
                height: screenHeight(100),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth(2),
                          horizontal: (screenHeight(3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          ResponsiveTextOnPinkWidget(
                                              fontSize: screenHeight(5.5),
                                              text: 'New Expense'),
                                          GestureDetector(
                                            onTap: () {
                                              _controller.animateTo(
                                                  screenWidth(100),
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  curve: Curves.easeInExpo);
                                            },
                                            child: Icon(
                                              FontAwesomeIcons.arrowRight,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenHeight(2),
                                      ),
                                      ResponsiveTextOnPinkWidget(
                                        fontSize: screenHeight(3),
                                        text: 'CHOOSE CATEGORY: ',
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.transparent,
                                        ),
                                        height: screenHeight(40),
                                        width: screenWidth(85),
                                        child: ListView.builder(
                                          itemCount: CategoryList
                                                  .getNumberOfCategories() -
                                              1,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<DatabaseHelper>(
                                                          context,
                                                          listen: false)
                                                      .switchSelectedCategory(
                                                          index);
                                                });
                                              },
                                              child: CategoryTileWidget(
                                                category: CategoryList
                                                    .getCategoriesList()[index],
                                                isSelected: CategoryList
                                                            .getCategoriesList()[
                                                        index]
                                                    .getSelected(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      ResponsiveTextOnPinkWidget(
                                        text: 'NAME:',
                                        fontSize: screenHeight(3),
                                      ),
                                      TextFieldWidget(
                                        hintText: 'NAME OF EXPENSE',
                                        keyboardType: TextInputType.text,
                                        next: true,
                                        onChanged: (value) {
                                          _nameOfExpense = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      ResponsiveTextOnPinkWidget(
                                        text: 'COST:',
                                        fontSize: screenHeight(3),
                                      ),
                                      TextFieldWidget(
                                        hintText: 'COST OF EXPENSE',
                                        keyboardType: TextInputType.number,
                                        next: false,
                                        onChanged: (value) {
                                          _costOfExpense = double.parse(value);
                                        },
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      ResponsiveTextOnPinkWidget(
                                        text: 'DATE:',
                                        fontSize: screenHeight(3),
                                      ),
                                      Container(
                                        height: screenHeight(40),
                                        width: screenWidth(80),
                                        child: CalendarDatePicker(
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now().subtract(
                                            Duration(days: 365),
                                          ),
                                          lastDate: DateTime.now().add(
                                            Duration(days: 365),
                                          ),
                                          onDateChanged: (value) {
                                            _dateOfExpense = value;
                                          },
                                        ),
                                      ),
                                      Center(
                                        child: BottomButtonWidget(
                                          text: 'SAVE',
                                          iconData: FontAwesomeIcons.plus,
                                          onTap: () {
                                            _categoryOfExpense = CategoryList
                                                .getSelectedCategory();
                                            Provider.of<DatabaseHelper>(context,
                                                    listen: false)
                                                .newExpense(
                                              IncomeExpense(
                                                  categoryName:
                                                      _categoryOfExpense
                                                          .getText(),
                                                  name: _nameOfExpense,
                                                  amount: _costOfExpense,
                                                  dateTime: _dateOfExpense),
                                            );
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenWidth(2),
                        horizontal: (screenHeight(3)),
                      ),
                      child: Container(
                        width: screenWidth(85),
                        height: screenHeight(100),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      _controller.animateTo(screenWidth(0),
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeInExpo);
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth(3),
                                  ),
                                  ResponsiveTextOnPinkWidget(
                                      fontSize: screenHeight(5.5),
                                      text: 'New Income'),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight(2),
                              ),
                              ResponsiveTextOnPinkWidget(
                                text: 'NAME:',
                                fontSize: screenHeight(3),
                              ),
                              TextFieldWidget(
                                hintText: 'NAME OF INCOME',
                                keyboardType: TextInputType.text,
                                next: true,
                                onChanged: (value) {
                                  _nameOfIncome = value;
                                },
                              ),
                              SizedBox(
                                height: screenHeight(1),
                              ),
                              ResponsiveTextOnPinkWidget(
                                text: 'AMOUNT:',
                                fontSize: screenHeight(3),
                              ),
                              TextFieldWidget(
                                hintText: 'AMOUNT OF INCOME',
                                keyboardType: TextInputType.number,
                                next: false,
                                onChanged: (value) {
                                  _amountOfIncome = double.parse(value);
                                },
                              ),
                              SizedBox(
                                height: screenHeight(1),
                              ),
                              ResponsiveTextOnPinkWidget(
                                text: 'DATE:',
                                fontSize: screenHeight(3),
                              ),
                              Container(
                                height: screenHeight(40),
                                width: screenWidth(80),
                                child: CalendarDatePicker(
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now().subtract(
                                    Duration(days: 365),
                                  ),
                                  lastDate: DateTime.now().add(
                                    Duration(days: 365),
                                  ),
                                  onDateChanged: (value) {
                                    _dateOfIncome = value;
                                  },
                                ),
                              ),
                              Center(
                                child: BottomButtonWidget(
                                  text: 'SAVE',
                                  iconData: FontAwesomeIcons.plus,
                                  onTap: () {
                                    Provider.of<DatabaseHelper>(context,
                                            listen: false)
                                        .newIncome(
                                      IncomeExpense(
                                        name: _nameOfIncome,
                                        amount: _amountOfIncome,
                                        dateTime: _dateOfIncome,
                                        categoryName: 'Income',
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
