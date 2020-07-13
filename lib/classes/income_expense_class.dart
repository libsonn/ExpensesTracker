import 'package:expenses_tracker/classes/categories_class.dart';

class IncomeExpense {
  double _amount;
  Category _category;
  String _name;
  DateTime _dateTime;

  IncomeExpense(
      {double amount, String name, Category category, DateTime dateTime}) {
    this._amount = amount;
    this._name = name;
    this._category = category;
    this._dateTime = dateTime;
  }

  double getAmount() => _amount;
  String getName() => _name;
  Category getCategory() => _category;
  DateTime getDateTime() => _dateTime;
}
