import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../backend_control/app_state_control.dart';
import 'package:fitlife/theme/theme_dataShip.dart';


Widget discoverFloatingNav(Map<String, IconData> items, BuildContext context){
  final appProvider = Provider.of<AppStateControl>(context);
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      for(var item in items.keys)
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  appProvider.change_currentDiscoverNavIndex(List.of(items.keys).indexOf(item));
                },
                icon: Icon(items[item],
                  color: (appProvider.currentDiscoverNavIndex == List.of(items.keys).indexOf(item))?
                    mainGreenGenerator(1):
                    mainBlackGenerator(1),
                ),
              ),
              Text(item,
                style: TextStyle(
                  color: (appProvider.currentDiscoverNavIndex == List.of(items.keys).indexOf(item))?
                    mainGreenGenerator(1):
                    mainBlackGenerator(1),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
    ],
  );
}