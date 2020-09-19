// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_expense_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomeExpenseAdapter extends TypeAdapter<IncomeExpense> {
  @override
  final int typeId = 1;

  @override
  IncomeExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncomeExpense()
      .._amount = fields[0] as double
      .._categoryName = fields[1] as String
      .._name = fields[2] as String
      .._dateTime = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, IncomeExpense obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._amount)
      ..writeByte(1)
      ..write(obj._categoryName)
      ..writeByte(2)
      ..write(obj._name)
      ..writeByte(3)
      ..write(obj._dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
