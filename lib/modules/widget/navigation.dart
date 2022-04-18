
import 'package:flutter/material.dart';

class NavWidgets{
  List<BottomNavigationBarItem> bottomNav= <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.category_sharp),
                label: "Catagory",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: "About Us",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline_rounded),
                  label: "Instruction"),
            ];
}