import 'package:expenses_tracker/constants.dart';
import 'package:expenses_tracker/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import '../classes/database_helper_class.dart';
import '../constants.dart';
import '../widgets/responsive_text_widget.dart';

class AboutScreen extends StatefulWidget {
  static String id = '/aboutScreen';
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  //URL Handler to open links
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Function screenWidth = Screen(context).wp;
    final Function screenHeight = Screen(context).hp;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth(100),
          height: screenHeight(100),
          decoration: kBackgroundColorGradient,
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
                      text: 'About App',
                      fontSize: screenHeight(5.5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth(2),
                        top: screenHeight(3),
                      ),
                      child: Row(
                        children: [
                          ResponsiveTextOnPinkWidget(
                            text: 'App design: ',
                            fontSize: screenHeight(3),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  _launchInBrowser(
                                      'https://dribbble.com/shots/5500007-Expense-Tracker');
                                },
                              );
                            },
                            child: ResponsiveTextOnPinkWidget(
                              text: 'DRIBBBLE',
                              fontSize: screenHeight(3),
                              link: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight(2),
                        bottom: screenHeight(1),
                        left: screenWidth(2),
                      ),
                      child: Row(
                        children: [
                          ResponsiveTextOnPinkWidget(
                            text: 'App creator: ',
                            fontSize: screenHeight(3),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  _launchInBrowser(
                                      'https://github.com/libsonn');
                                },
                              );
                            },
                            child: ResponsiveTextOnPinkWidget(
                              text: 'GITHUB',
                              fontSize: screenHeight(3),
                              link: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight(1),
                          left: screenWidth(2),
                          right: screenWidth(2),
                          bottom: screenHeight(2)),
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: screenHeight(0.1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ResponsiveTextOnPinkWidget(
                          text: 'Clear all data',
                          fontSize: screenHeight(3),
                        ),
                        RaisedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                color: Color.fromARGB(255, 54, 18, 58),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: klightPurpleColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: screenHeight(20),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: screenWidth(5),
                                      horizontal: screenHeight(7),
                                    ),
                                    child: Column(
                                      children: [
                                        ResponsiveTextOnPinkWidget(
                                          text:
                                              'Do you want to erase all data?',
                                          fontSize: screenHeight(3),
                                        ),
                                        SizedBox(
                                          height: screenHeight(3),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            RaisedButton(
                                              onPressed: () {
                                                Provider.of<DatabaseHelper>(
                                                        context,
                                                        listen: false)
                                                    .clearData();
                                                Navigator.pop(context);
                                              },
                                              color: Colors.white,
                                              child:
                                                  ResponsiveTextOnWhiteWidget(
                                                      fontSize: screenHeight(2),
                                                      text: 'YES'),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              color: Colors.white,
                                              child:
                                                  ResponsiveTextOnWhiteWidget(
                                                      fontSize: screenHeight(2),
                                                      text: 'NO'),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          color: Colors.white,
                          child: ResponsiveTextOnWhiteWidget(
                            text: 'CLEAR',
                            fontSize: screenHeight(2),
                          ),
                        ),
                      ],
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
