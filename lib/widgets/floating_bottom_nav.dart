import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:fitlife/backend_control/app_state_control.dart';
Widget floatingBottomNavigation(Map<String, Icon> iconsMap, BuildContext context){
  final appProvider = Provider.of<AppStateControl>(context);
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      // color: mainGreenGenerator(0.7),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(width: 1,
            color: mainGreenGenerator(0.6))),
        borderRadius: BorderRadius.circular(10),

        /* use box-Shadow or gradient to style not together*/

        // boxShadow: [
        //   BoxShadow(color: mainWhiteGenerator(1),
        //     blurRadius: 5,
        //     blurStyle: BlurStyle.outer),
        //   BoxShadow(color: mainGreenGenerator(1),
        //     blurRadius: 10,
        //     blurStyle: BlurStyle.outer),
        //   BoxShadow(color: mainGreyGenerator(1),
        //       blurRadius: 2,
        //       blurStyle: BlurStyle.outer),
        // ],

        gradient: LinearGradient(colors: [
          mainBlackGenerator(0.3),
          secondGreenGenerator(0.5),
          mainGreenGenerator(0.5),
          secondGreenGenerator(0.5),
          mainBlackGenerator(0.3),
        ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(var item in iconsMap.keys)
            Container(
              // padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: (iconsMap.keys.toList().indexOf(item) == appProvider.currentBottomNavIndex)?
                  mainGreenGenerator(0.6): Colors.transparent,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    appProvider.change_currentBottomNavIndex(iconsMap.keys.toList().indexOf(item));
                  }, icon: iconsMap[item]!,
                    color: mainBlackGenerator(1),
                    splashColor: mainWhiteGenerator(1),),
                  Text((iconsMap.keys.toList().indexOf(item) == appProvider.currentBottomNavIndex)?
                  " $item  " : "",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

        ],
      ),
    ),
  );
}
