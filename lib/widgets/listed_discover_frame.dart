import 'dart:math';

import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network_control/exercise_object.dart';

class ListedDiscoverFrame extends StatefulWidget{
  ListedDiscoverFrame({super.key, required this.exerciseObject});
  ExerciseObject exerciseObject;

  @override
  createState() => _ListedDiscoverFrameState(exerciseObject);
}

class _ListedDiscoverFrameState extends State<ListedDiscoverFrame>{
  ExerciseObject exerciseObject;

  _ListedDiscoverFrameState(this.exerciseObject);

  String truncateString(String given){
    String rw = "";
    given.split(" ").forEach((word){
      rw += (given.split(" ").indexOf(word) < 3)? " $word" : "";
    });
    return rw;
  }
  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 5),
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(top: 9, left: 10),
            decoration: BoxDecoration(
              color: mainBlackGenerator(1),
              border: Border.all(
                width: 5,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: secondGreenGenerator(1),
                  spreadRadius: 9,
                  blurStyle: BlurStyle.outer,
                )
              ]
            ),
          ),
          Container(
            // width: screenSize.width-20,
            height: 90,
            margin: EdgeInsets.only(left: 35, right: 10),
            decoration: BoxDecoration(
              color: mainBlackGenerator(0.5),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: mainGreenGenerator(0.4))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(

                        scrollDirection: Axis.horizontal,

                        child: Text(truncateString(exerciseObject.name),
                          style: TextStyle(
                            color: mainWhiteGenerator(1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text("Targets ${exerciseObject.target}",
                        style: TextStyle(
                          color: mainGreyGenerator(1),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: (){

                    }, icon: Icon(CupertinoIcons.heart,
                      color: mainGreenGenerator(1),
                    ),
                  ),
                  ElevatedButton(onPressed: (){

                  },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(secondGreenGenerator(1)),
                    ), child: Icon(CupertinoIcons.arrow_right,
                      color: mainBlackGenerator(1),
                    ),

                  )
                ],
              ),
            ),
          ),
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(top: 9, left: 10),
            decoration: BoxDecoration(
              color: secondGreenGenerator(1),
              shape: BoxShape.circle,
            ),
            child: Align(
              child: Icon(CupertinoIcons.app_badge_fill),
            ),
          ),
        ],
      ),
    );
  }
}