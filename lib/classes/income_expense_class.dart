import 'package:hive/hive.dart';

part 'income_expense_class.g.dart';

@HiveType(typeId: 3)
class IncomeExpense {
  @HiveField(0)
  double _amount;
  @HiveField(4)
  String _categoryName;
  @HiveField(2)
  String _name;
  @HiveField(3)
  DateTime _dateTime;

  IncomeExpense(
      {double amount, String name, String categoryName, DateTime dateTime}) {
    this._amount = amount;
    this._name = name;
    this._categoryName = categoryName;
    this._dateTime = dateTime;
  }

  double getAmount() => _amount;
  String getName() => _name;
  String getCategoryName() => _categoryName;
  DateTime getDateTime() => _dateTime;
}
