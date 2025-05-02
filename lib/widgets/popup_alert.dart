import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/backend_control/app_state_control.dart';


// this fun depends on alertState parameter to show error or success
// content and target are list holding content at index 0 for success and
// content at index 1 for error
Widget popUPAlert(BuildContext context, String title, List<String> content, List<Widget> target, bool alertState){
  Size screenSize = MediaQuery.sizeOf(context);
  return Container(
    width: screenSize.width,
    height: screenSize.height,
    decoration: BoxDecoration(
      gradient: backgroundGradient
    ),
    child: Align(
      child: CupertinoAlertDialog(
        title: Text(title),
        content: Text(alertState? content[0] : content[1]),
        actions: [
          ElevatedButton(onPressed: (){
            alertState?
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_)=> target[0]),
            ):
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_)=> target[1]),
            );
          },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  alertState?secondGreenGenerator(1):
                      Colors.red
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(color: mainGreenGenerator(1))
              ))
            ), child: Text(alertState? "OK" : "Cancel",
            style: TextStyle(color: mainBlackGenerator(1)),),
          )
        ],
      ),
    ),
  );
}