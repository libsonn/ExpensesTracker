import 'package:expenses_tracker/classes/database_helper_class.dart';
import 'package:expenses_tracker/screens/main_screen.dart';
import 'package:expenses_tracker/screens/new_income_expense_screen.dart';
import 'package:expenses_tracker/screens/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'constants.dart';

void main() {
  Intl.defaultLocale = 'pl_PL';
  initializeDateFormatting('pl_PL');

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/0FL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

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
          scaffoldBackgroundColor: klightPurpleColor,
          brightness: Brightness.dark,
          primaryColor: klightPurpleColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScreen(),
        initialRoute: MainScreen.id,
        routes: {
          NewIncomeExpenseScreen.id: (context) => NewIncomeExpenseScreen(),
          MainScreen.id: (context) => MainScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
        },
      ),
    );
  }
}
