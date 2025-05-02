import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/backend_control/app_state_control.dart';

import '../theme/theme_dataShip.dart';

Widget searchWithDropdown(BuildContext context, List<List> options){
  final screenSize = MediaQuery.sizeOf(context);
  final appProvider = Provider.of<AppStateControl>(context);
  return DropdownMenu(
    width: screenSize.width/1.5,
    textStyle: TextStyle(color: Colors.white, fontSize: 18),
    label: Text("search",
      style: TextStyle(
          color: secondGreenGenerator(1),
          fontSize: 20
      ),
    ),
    leadingIcon: Icon(CupertinoIcons.search,
      color: mainWhiteGenerator(1),
    ),
    trailingIcon: Icon(CupertinoIcons.list_bullet_below_rectangle,
      color: mainWhiteGenerator(1),
    ),
    selectedTrailingIcon: Icon(CupertinoIcons.arrow_down_circle,
      color: secondGreenGenerator(1),
    ),
    menuStyle: MenuStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
          side: BorderSide(color: mainGreenGenerator(1))
      )),
    ),
    dropdownMenuEntries:[
      for(var option in options[appProvider.currentDiscoverNavIndex])
        DropdownMenuEntry(value: option, label: option),
    ],
    onSelected: (value){
      appProvider.change_specifier_offset(0, value);
    },
  );
}
