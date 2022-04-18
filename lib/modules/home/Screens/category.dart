import 'package:maleda_hospital/constants/constants.dart';
import 'package:maleda_hospital/modules/home/Screens/nestedScreen/category-detail.dart';
import 'package:maleda_hospital/modules/widget/category-card-widget.dart';
import 'package:flutter/material.dart';
import 'package:maleda_hospital/modules/widget/gradiant-animation.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late List catagories;

  @override
  void initState() {
    super.initState();
    catagories = Constants.CATEGORIES;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GradiantAnimationBackground(),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
         
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.blue,
                    endIndent: 20,
                  ),
                ),
                Text(
                  'Catagory',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.blue,
                    indent: 20,
                  ),
                ),
              ]),
              SizedBox(height: 50),
              Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
                        itemCount: (catagories.length),
                        itemBuilder: (_, i) {
                          int a = i * 2;
                          int b = (i * 2) + 1;
                          return Row(
                            children: [
                              if ((a <= (catagories.length - 1)))
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new CategoryDetail(
                                                      category:
                                                          catagories[a])));
                                    },
                                    child: CategoryCardWidget()
                                        .catagoryCard(context, catagories, a)),
                              if ((b <= (catagories.length - 1)))
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new CategoryDetail(
                                                      category:
                                                          catagories[b])));
                                    },
                                    child: CategoryCardWidget()
                                        .catagoryCard(context, catagories, b)),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
