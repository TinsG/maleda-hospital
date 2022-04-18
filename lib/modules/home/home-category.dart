import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:maleda_hospital/modules/home/Screens/about.dart';
import 'package:maleda_hospital/modules/home/Screens/category.dart';
import 'package:maleda_hospital/modules/home/Screens/instruction.dart';
import 'package:maleda_hospital/modules/widget/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maleda_hospital/styles/app_colors.dart';


class HomeCategory extends StatefulWidget {
  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  static const List<Widget> _widgetOptions = <Widget>[
    Category(),
    About(),
    Instruction(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar:   const SnackBar(
            content: Text('Tap back again to leave')),
        child: Container(
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: NavWidgets().bottomNav,
              activeColor: Colors.amber[600],
              backgroundColor: CupertinoColors.quaternarySystemFill,
              inactiveColor: AppColors.primaryColor,
              iconSize: 28,
            ),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    child: Center(
                        child: Center(
                      child: _widgetOptions.elementAt(index),
                    )),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
