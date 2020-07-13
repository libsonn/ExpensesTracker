import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  MaterialColor _color;
  IconData _iconData;
  String _text;
  bool _isSelected = false;

  Category(
      {@required MaterialColor color,
      @required IconData icon,
      @required String text}) {
    this._color = color;
    this._iconData = icon;
    this._text = text;
  }

  void setSelected(bool isSelected) {
    _isSelected = isSelected;
  }

  String getText() => _text;
  IconData getIconData() => _iconData;
  MaterialColor getColor() => _color;
  bool getSelected() => _isSelected;
}

class CategoryList {
  static List<Category> categoriesList = [
    Category(text: 'Housing', color: Colors.blue, icon: FontAwesomeIcons.home),
    Category(
        text: 'Transportation',
        color: Colors.green,
        icon: FontAwesomeIcons.bus),
    Category(
        text: 'Taxes', color: Colors.red, icon: FontAwesomeIcons.dollarSign),
    Category(
        text: 'Food', color: Colors.amber, icon: FontAwesomeIcons.hamburger),
    Category(
        text: 'Child Expenses',
        color: Colors.cyan,
        icon: FontAwesomeIcons.child),
    Category(
        text: 'Health Care',
        color: Colors.deepPurple,
        icon: FontAwesomeIcons.pumpMedical),
    Category(
        text: 'Insurance',
        color: Colors.brown,
        icon: FontAwesomeIcons.laptopMedical),
    Category(
        text: 'Utilities', color: Colors.orange, icon: FontAwesomeIcons.water),
    Category(
        text: 'Consumer Debt',
        color: Colors.indigo,
        icon: FontAwesomeIcons.info),
    Category(
        text: 'Personal Care',
        color: Colors.lime,
        icon: FontAwesomeIcons.heart),
    Category(text: 'Pets', color: Colors.pink, icon: FontAwesomeIcons.cat),
    Category(
        text: 'Giving',
        color: Colors.teal,
        icon: FontAwesomeIcons.handHoldingHeart),
    Category(
        text: 'Clothes', color: Colors.yellow, icon: FontAwesomeIcons.tshirt),
    Category(
        text: 'Home Supplies',
        color: Colors.lightBlue,
        icon: FontAwesomeIcons.pumpSoap),
    Category(
        text: 'Gifts', color: Colors.lightGreen, icon: FontAwesomeIcons.gift),
    Category(
        text: 'Fun', color: Colors.deepOrange, icon: FontAwesomeIcons.cocktail),
    Category(
        text: 'Services/Memberships',
        color: Colors.purple,
        icon: FontAwesomeIcons.idCard),
    Category(
        text: 'Savings', color: Colors.blueGrey, icon: FontAwesomeIcons.wallet),
    Category(
        text: 'Other', color: Colors.grey, icon: FontAwesomeIcons.question),
    Category(
        text: 'Income', color: Colors.amber, icon: FontAwesomeIcons.dollarSign),
  ];

  static void switchSelected(int index) {
    if (categoriesList[index].getSelected() == true) {
      categoriesList[index].setSelected(false);
    } else {
      for (Category category in categoriesList) {
        category.setSelected(false);
      }
      categoriesList[index].setSelected(true);
    }
  }

  static Category getSelectedCategory() {
    Category selectedCategory = getCategoryFromLast(1);

    for (Category category in categoriesList) {
      if (category.getSelected()) {
        selectedCategory = category;
      }
    }
    return selectedCategory;
  }

  static List<Category> getCategoriesList() => categoriesList;

  static Category getCategoryFromLast(int index) {
    return categoriesList.elementAt(categoriesList.length - 1 - index);
  }

  static int getNumberOfCategories() => categoriesList.length;
}
