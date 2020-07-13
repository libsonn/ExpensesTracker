import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/income_expense_class.dart';
import 'package:flutter/cupertino.dart';

class DatabaseHelper extends ChangeNotifier {
  List<IncomeExpense> _listOfIncomesExpenses = [];

  double _balance = 0;
  double _amountOfIncomes = 0;
  double _amountOfExpenses = 0;

  void newExpense(IncomeExpense expense) {
    _listOfIncomesExpenses.add(expense);
    _balance -= expense.getAmount();
    _amountOfExpenses += expense.getAmount();

    notifyListeners();
  }

  void newIncome(IncomeExpense income) {
    _listOfIncomesExpenses.add(income);
    _balance += income.getAmount();
    _amountOfIncomes += income.getAmount();

    notifyListeners();
  }

  void switchSelectedCategory(int index) {
    CategoryList.switchSelected(index);

    notifyListeners();
  }

  List<IncomeExpense> getListOfIncomesExpenses() =>
      List<IncomeExpense>.from(_listOfIncomesExpenses.reversed);

  int getNumberOfIncomesExpenses() => _listOfIncomesExpenses.length;

  double getBalance() => _balance;
  double getAmountOfIncomes() => _amountOfIncomes;
  double getAmountOfExpenses() => _amountOfExpenses;
}
