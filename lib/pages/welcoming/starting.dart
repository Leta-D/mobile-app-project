import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:fitlife/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:fitlife/pages/welcoming/take_user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StartWelcomePage extends StatelessWidget{
  // const StartWelcomePage({super.key});
  bool _isNewUser = true;
  Future<void> isNewUserPref() async {
    final prefer = await SharedPreferences.getInstance();
    print(prefer.get("isNewUser"));
    _isNewUser = prefer.getBool("isNewUser")!;
  }

  // only testing function
  Future<void> isNewUserPrefDispo() async {
    final prefer = await SharedPreferences.getInstance();
    prefer.remove("isNewUser");
  }
  StartWelcomePage({super.key}){
    print("User first time checked");
    isNewUserPref();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: mainBlackGenerator(1),),
          Image.asset("images/muscular_man_noBack.png",
            colorBlendMode: BlendMode.softLight,
            // color: Color.fromRGBO(139, 227, 7, 1),
            color: mainBlackGenerator(1),
            fit: BoxFit.cover,
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 2,
                    color: mainGreenGenerator(1),
                  ),
                  Text("WELCOME",
                    style: TextStyle(
                      color: mainWhiteGenerator(0.9),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("to",
                    style: TextStyle(
                      color: secondGreenGenerator(1),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("FitLife !",
                    style: TextStyle(
                      color: mainGreenGenerator(1),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 2,
                    color: mainGreenGenerator(1),
                  ),
                  ElevatedButton(onPressed: (){
                    // checking if user is using for 1st time
                    _isNewUser?
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>TakeRegistry())
                    ):
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>MainPage())
                    );
                  },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(mainGreenGenerator(1)),
                      foregroundColor: MaterialStateProperty.all(mainBlackGenerator(1)),
                      shadowColor: MaterialStateProperty.all(mainWhiteGenerator(1)),
                      elevation: MaterialStateProperty.all(10),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
                        ),
                      ),

                    ), child: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Text("Get started   "),
                        Icon(CupertinoIcons.arrow_right_circle_fill,
                        color: mainBlackGenerator(1),)
                      ],
                    ),
                  ),
                  ),
                ],
              ),
            ),

          )

        ],
      ),
    );
  }
}