import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:fitlife/widgets/floating_bottom_nav.dart';
import 'package:fitlife/pages/home_page.dart';
import 'package:fitlife/pages/discover_page.dart';
import 'package:fitlife/pages/notification_page.dart';
import 'package:fitlife/pages/setting_page.dart';


class MainPage extends StatelessWidget{
  MainPage({super.key});
  final data = {
    "Home": Icon(CupertinoIcons.home),
    "Discover": Icon(CupertinoIcons.search),
    "Favorite": Icon(CupertinoIcons.heart_circle),
    "Setting": Icon(CupertinoIcons.settings),
  };
  final pages = [
    HomePage(),
    DiscoverPage(),
    NotificationPage(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    final appProvider = Provider.of<AppStateControl>(context);
    return Scaffold(
      // this is used to reduce brightness of the background-color
      backgroundColor: mainGreyGenerator(0.6),

      appBar: AppBar(
        backgroundColor: mainBlackGenerator(0.9),
        elevation: 5,
        shadowColor: secondGreenGenerator(0.7),
        leading: Image.asset("assets/images/fitLifeLogo.png"),
        leadingWidth: 90,
        title: Text("FitLife"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: mainGreenGenerator(1),
          fontSize: 30,letterSpacing: 5,
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(CupertinoIcons.moon_fill),
            color: mainBlackGenerator(1),
          )

        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Stack(
          children: [
            pages[appProvider.currentBottomNavIndex],
            floatingBottomNavigation(data, context),
          ],
        ),
      ),
    );
  }
}
