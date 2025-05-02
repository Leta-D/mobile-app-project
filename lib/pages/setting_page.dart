import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/cupertino.dart';

class SettingPage extends StatelessWidget{
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: mainGreenGenerator(1),
          height: 50,
          child: Text("Setting Page")),
    );
  }
}