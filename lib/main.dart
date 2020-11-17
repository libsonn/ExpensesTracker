import 'dart:io';

import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/classes/income_expense_class.dart';
import 'package:expenses_tracker/screens/categories_screen.dart';
import 'package:expenses_tracker/screens/charts_screen.dart';
import 'package:expenses_tracker/screens/home_screen.dart';
import 'package:expenses_tracker/screens/main_screen.dart';
import 'package:expenses_tracker/screens/new_income_expense_screen.dart';
import 'package:expenses_tracker/screens/about_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'constants.dart';
import 'package:hive/hive.dart';

void main() async {
  Intl.defaultLocale = 'pl_PL';
  initializeDateFormatting('pl_PL');

  LicenseRegistry.addLicense(
    () async* {
      final license = await rootBundle.loadString('google_fonts/0FL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    },
  );

  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  Hive.registerAdapter(IncomeExpenseAdapter());

  runApp(ExpensesTrackerApp());
}

class ExpensesTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return DatabaseHelper();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expenses Tracker',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: klightPurpleColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            bottomAppBarColor: Colors.white),
        home: MainScreen(),
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          CategoriesScreen.id: (context) => CategoriesScreen(),
          NewIncomeExpenseScreen.id: (context) => NewIncomeExpenseScreen(),
          ChartsScreen.id: (context) => ChartsScreen(),
          AboutScreen.id: (context) => AboutScreen(),
        },
      ),
    );
  }
}
