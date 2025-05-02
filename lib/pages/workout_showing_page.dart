import 'package:flutter/cupertino.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/material.dart';

class WorkoutShowingPage extends StatelessWidget{
   const WorkoutShowingPage({super.key,required this.steps, required this.imgUrl, required this.name});
  final String imgUrl,name;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 55,),
                  Container(
                    alignment: Alignment.center,
                    width: screenSize.width,
                    height: screenSize.width/2,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset(imgUrl,
                      width: screenSize.width/2,
                      fit: BoxFit.contain,
                    )
                  ),
                  for(var step in steps)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.circle_grid_hex_fill,
                              color: mainGreenGenerator(1),
                            ),
                            Text(step,
                              style: TextStyle(color: mainWhiteGenerator(1)),
                            )
                          ],
                        ),
                        Container(
                          height: (steps.indexOf(step) == 0)?50: 10,
                          width: 2,
                          margin: EdgeInsets.only(left: 12),
                          color: mainGreenGenerator(1),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: mainGreenGenerator(0.1),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.canPop(context)? Navigator.pop(context) :
                    Navigator.pushReplacementNamed(context, "mainPage");
                  }, icon: Icon(CupertinoIcons.back,
                    color: mainWhiteGenerator(1),
                  ),
                  ),
                  Text("Push Up",
                    style: TextStyle(
                      color: mainWhiteGenerator(1),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}