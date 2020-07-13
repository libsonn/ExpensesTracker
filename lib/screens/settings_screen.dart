import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class SettingsScreen extends StatefulWidget {
  static String id = '/settingsScreen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth(100),
          height: screenHeight(100),
          decoration: backgroundColorGradient,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth(1),
                  screenHeight(4),
                  screenWidth(1),
                  screenHeight(1),
                ),
                child: Column(
                  children: <Widget>[
                    ResponsiveTextOnPinkWidget(
                      text: 'Settings',
                      fontSize: screenHeight(5.5),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
