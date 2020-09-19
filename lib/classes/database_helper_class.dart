import 'package:expenses_tracker/classes/categories_class.dart';
import 'package:expenses_tracker/classes/income_expense_class.dart';
import 'package:expenses_tracker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class DatabaseHelper extends ChangeNotifier {
  List<IncomeExpense> _listOfIncomesExpenses = [];
  Box<IncomeExpense> incomeExpenseBox;

  double _balance = 0;
  double _amountOfIncomes = 0;
  double _amountOfExpenses = 0;

  void calculateData() {
    _balance = 0;
    _amountOfExpenses = 0;
    _amountOfIncomes = 0;

    for (IncomeExpense incomeExpense in _listOfIncomesExpenses) {
      incomeExpense.getCategoryName() != 'Income'
          ? _balance -= incomeExpense.getAmount()
          : _balance += incomeExpense.getAmount();

      incomeExpense.getCategoryName() != 'Income'
          ? _amountOfExpenses += incomeExpense.getAmount()
          : _amountOfIncomes += incomeExpense.getAmount();
    }
  }

  void getDataFromDatabase() async {
    incomeExpenseBox = await Hive.openBox<IncomeExpense>(DBFileName);
    _listOfIncomesExpenses = [];
    List<int> keys = incomeExpenseBox.keys.cast<int>().toList();
    for (int key in keys) {
      _listOfIncomesExpenses.add(incomeExpenseBox.get(key));
    }

    calculateData();
    notifyListeners();
  }

  void newExpense(IncomeExpense expense) async {
    _listOfIncomesExpenses.add(expense);
    var box = await Hive.openBox<IncomeExpense>(DBFileName);
    calculateData();

    box.add(expense);

    notifyListeners();
  }

  void newIncome(IncomeExpense income) async {
    _listOfIncomesExpenses.add(income);
    var box = await Hive.openBox<IncomeExpense>(DBFileName);
    calculateData();

    box.add(income);

    notifyListeners();
  }

  void clearData() async {
    _balance = 0;
    _amountOfExpenses = 0;
    _amountOfIncomes = 0;
    _listOfIncomesExpenses.clear();

    await Hive.deleteBoxFromDisk(DBFileName);

    notifyListeners();
  }

  void switchSelectedCategory(int index) {
    CategoryList.switchSelected(index);

    notifyListeners();
  }

  List<IncomeExpense> getListOfIncomesExpenses() =>
      List<IncomeExpense>.from(_listOfIncomesExpenses.reversed);

  List<IncomeExpense> getListOfSelectedCategory(String categoryName) {
    List<IncomeExpense> _listOfSelectedCategory = [];

    for (IncomeExpense incomeExpense in _listOfIncomesExpenses) {
      if (incomeExpense.getCategoryName() == categoryName) {
        _listOfSelectedCategory.add(incomeExpense);
      }
    }

    return _listOfSelectedCategory;
  }

  int getNumberOfSelectedCategory(Category category) {
    return getListOfSelectedCategory(category.getText()).length;
  }

  double getAmountOfCategory(Category category) {
    double _amount = 0;
    for (IncomeExpense incomeExpense
        in getListOfSelectedCategory(category.getText())) {
      _amount += incomeExpense.getAmount();
    }
    return _amount;
  }

  int getNumberOfIncomesExpenses() => _listOfIncomesExpenses.length;

  double getBalance() => _balance;
  double getAmountOfIncomes() => _amountOfIncomes;
  double getAmountOfExpenses() => _amountOfExpenses;
}
