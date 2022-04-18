import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maleda_hospital/modules/home/Screens/nestedScreen/gif-display.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

class SubCategoryListWidget {
  ListView getSubCategoryList(catList) {
    return ListView.separated(
      
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
    shrinkWrap: true,
      itemCount: catList["lists"].length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 85,
          decoration: BoxDecoration(
            color: WidgetsBinding.instance?.window.platformBrightness ==
                    Brightness.dark
                ? AppColors.lightBlack.withOpacity(0.7)
                : Colors.white60,
            borderRadius: BorderRadiusDirectional.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  offset: Offset(3, 3),
                  color: WidgetsBinding.instance?.window.platformBrightness ==
                          Brightness.dark
                      ? AppColors.white.withOpacity(0.09)
                      : AppColors.lightBlack.withOpacity(0.1)),
              BoxShadow(
                  blurRadius: 3,
                  offset: Offset(-5, -5),
                  color: WidgetsBinding.instance?.window.platformBrightness ==
                          Brightness.dark
                      ? AppColors.white.withOpacity(0.01)
                      : AppColors.lightBlack.withOpacity(0.1)),
            ],
          ),
          child: ListTile(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new DisplayGif(
                        selectedObject: catList['lists'][index])));
              },
              title: listViewRow(context, catList, index)),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Row listViewRow(BuildContext context, catList, index) {
    return Row(
      children: [
        // No no
        Container(
          // width: MediaQuery.of(context).size.width / 6,
          padding: const EdgeInsets.only(left: 10, right: 20),
          height: 50,
          decoration: BoxDecoration(
              border: Border(
            right: BorderSide(
                width: 1,
                color: WidgetsBinding.instance?.window.platformBrightness ==
                        Brightness.dark
                    ? Colors.amber.shade100
                    : AppColors.darkBlack.withOpacity(0.6)),
          )),
          child: Center(
            child: Text(
              catList['lists'][index]['sn'].toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: WidgetsBinding.instance?.window.platformBrightness ==
                          Brightness.dark
                      ? Colors.amber.shade100
                      : AppColors.darkBlack.withOpacity(0.6)),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    catList['lists'][index]['listAm'].toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: WidgetsBinding
                                    .instance?.window.platformBrightness ==
                                Brightness.dark
                            ? Colors.amber.shade100
                            : AppColors.darkBlack.withOpacity(0.7)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    catList['lists'][index]['listEn'].toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: WidgetsBinding
                                    .instance?.window.platformBrightness ==
                                Brightness.dark
                            ? Colors.amber.shade100
                            : AppColors.darkBlack.withOpacity(0.7)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.chevron_right_sharp,
          color: WidgetsBinding.instance?.window.platformBrightness ==
                  Brightness.dark
              ? Colors.amber[100]
              : AppColors.darkBlack.withOpacity(0.7),
          size: 25,
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
