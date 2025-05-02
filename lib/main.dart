import 'package:fitlife/pages/workout_showing_page.dart';
import 'package:flutter/material.dart';
import 'package:fitlife/pages/welcoming/starting.dart';
// import 'package:fitlife/pages/welcoming/take_user_info.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:fitlife/pages/main_page.dart';

import 'package:fitlife/widgets/popup_alert.dart';

void main(){
  runApp(
      ChangeNotifierProvider(create: (_) => AppStateControl(),
          child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FitLife",
      routes: {
        // "registry": (context) => TakeRegistry(),
        "mainPage": (_) => MainPage(),
        // "detailWorkout": (_) => WorkoutShowingPage(),
      },
      home: StartWelcomePage(),
    );
  }

}