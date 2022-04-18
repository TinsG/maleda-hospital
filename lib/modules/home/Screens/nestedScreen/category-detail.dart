import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maleda_hospital/modules/widget/gradiant-animation.dart';
import 'package:maleda_hospital/modules/widget/sub-catagory-list-widget.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

class CategoryDetail extends StatefulWidget {
  final category;
  CategoryDetail({Key? key, this.category}) : super(key: key);
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  var catLists;
  List entries = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/categories-list.json")
        .then((value) {
      setState(() {
        List a = (json.decode(value));
        this.catLists = (a.where((i) => i['code']== widget.category['code'] )).toList();
         
        print(this.catLists);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
    print(this.catLists);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Stack(
          children: [
            GradiantAnimationBackground(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: WidgetsBinding.instance?.window.platformBrightness ==
                          Brightness.dark
                      ? Colors.amber.shade100
                      : AppColors.darkBlack.withOpacity(0.6),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text(
                  widget.category["titleAm"] +
                      ' | ' +
                      widget.category["titleEn"],
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          WidgetsBinding.instance?.window.platformBrightness ==
                                  Brightness.dark
                              ? Colors.amber.shade100
                              : AppColors.darkBlack.withOpacity(0.6),
                      fontWeight: FontWeight.w800),
                ),
              ),
              body: Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Stack(
                    children: [
                      (this.catLists?.isEmpty ?? true)
                          ? Center(child: Column(
                            children: [
                              SizedBox(height: 100,),
                              Text("Coming Soon",
                              style: TextStyle(
                      fontSize: 36,
                      color:
                          WidgetsBinding.instance?.window.platformBrightness ==
                                  Brightness.dark
                              ? Colors.amber.shade100
                              : AppColors.darkBlack.withOpacity(0.6),
                      fontWeight: FontWeight.w200), ),
                              SizedBox(height: 100,),
                              Lottie.asset("assets/json/lottie/404/404.json"),
                            ],
                          ),):
                           SubCategoryListWidget()
                              .getSubCategoryList(this.catLists[0])
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
