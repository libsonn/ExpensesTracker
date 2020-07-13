import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/screens/home_screen.dart';
import 'package:expenses_tracker/screens/new_income_expense_screen.dart';
import 'package:expenses_tracker/screens/settings_screen.dart';
import 'package:expenses_tracker/widgets/page_selector_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_screen/responsive_screen.dart';

class MainScreen extends StatefulWidget {
  static String id = '/main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(
    initialPage: 0,
  );

  bool isHomeScreenSelected = true;
  bool isCategoryScreenSelected = false;
  bool isNewIncomeExpenseScreenSelected = false;
  bool isChartScreenSelected = false;
  bool isSettingsScreenSelected = false;

  void switchSelection(int pageNumber) {
    switch (pageNumber) {
      case 0:
        isHomeScreenSelected = true;
        isCategoryScreenSelected = false;
        isNewIncomeExpenseScreenSelected = false;
        isChartScreenSelected = false;
        isSettingsScreenSelected = false;
        break;
      case 1:
        isHomeScreenSelected = false;
        isCategoryScreenSelected = true;
        isNewIncomeExpenseScreenSelected = false;
        isChartScreenSelected = false;
        isSettingsScreenSelected = false;
        break;
      case 2:
        isHomeScreenSelected = false;
        isCategoryScreenSelected = false;
        isNewIncomeExpenseScreenSelected = true;
        isChartScreenSelected = false;
        isSettingsScreenSelected = false;
        break;
      case 3:
        isHomeScreenSelected = false;
        isCategoryScreenSelected = false;
        isNewIncomeExpenseScreenSelected = false;
        isChartScreenSelected = true;
        isSettingsScreenSelected = false;
        break;
      case 4:
        isHomeScreenSelected = false;
        isCategoryScreenSelected = false;
        isNewIncomeExpenseScreenSelected = false;
        isChartScreenSelected = false;
        isSettingsScreenSelected = true;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: backgroundColorGradient,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    HomeScreen(),
                    SettingsScreen(),
                  ],
                ),
              ),
            ),
            Container(
              color: kdarkPurpleColor,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth(3),
                    screenHeight(2),
                    screenWidth(3),
                    screenHeight(1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PageSelectorButton(
                        icon: FontAwesomeIcons.home,
                        text: 'Home',
                        onTap: () {
                          setState(() {
                            switchSelection(0);
                            _pageController.animateToPage(0,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInExpo);
                          });
                        },
                        isSelected: isHomeScreenSelected,
                      ),
                      PageSelectorButton(
                        icon: FontAwesomeIcons.shapes,
                        text: 'Cetegory',
                        onTap: () {
                          setState(() {
                            switchSelection(1);
                          });
                        },
                        isSelected: isCategoryScreenSelected,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: klightPurpleColor,
                        ),
                        width: screenHeight(6),
                        height: screenHeight(6),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 2),
                                  transitionsBuilder: (context, animation,
                                      secondAnimation, child) {
                                    var begin = Offset(0.0, 1.0);
                                    var end = Offset.zero;
                                    var curve = Curves.bounceIn;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                  pageBuilder:
                                      (context, animation, secondAnimation) {
                                    return NewIncomeExpenseScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: klightPurpleColor,
                              ),
                              width: screenHeight(5.7),
                              height: screenHeight(5.7),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PageSelectorButton(
                        icon: FontAwesomeIcons.chartPie,
                        text: 'Charts',
                        onTap: () {
                          setState(() {
                            switchSelection(3);
                          });
                        },
                        isSelected: isChartScreenSelected,
                      ),
                      PageSelectorButton(
                        icon: FontAwesomeIcons.cogs,
                        text: 'Settings',
                        onTap: () {
                          setState(() {
                            switchSelection(4);
                            _pageController.animateToPage(1,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInExpo);
                          });
                        },
                        isSelected: isSettingsScreenSelected,
                      ),
                    ],
                  ),
                ),
                width: double.infinity,
                height: screenHeight(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
