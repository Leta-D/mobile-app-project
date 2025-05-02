import 'package:flutter/cupertino.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:fitlife/widgets/listed_item_frame.dart';
import 'package:fitlife/backend_control/app_dataB_control.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.fromLTRB(20,5,10,0),
          decoration: BoxDecoration(
            color: mainGreyGenerator(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Icon(CupertinoIcons.hand_raised_fill,
              color: secondGreenGenerator(1),),
              Text("USer-Name",
                style: TextStyle(
                  color: mainWhiteGenerator(1),
                  fontSize: 25,

                ),
              ),
            ],
          ),
        ),

        // ElevatedButton(onPressed: (){},
        // style: ButtonStyle(
        // ), child: Text("Alert"),),

        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Popular Workouts",
            style: TextStyle(
              color: mainWhiteGenerator(1),
              fontSize: 20,

            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border(
                top: BorderSide(color: mainBlackGenerator(1)),
                bottom: BorderSide(color: mainBlackGenerator(1)),

              ),
              gradient: LinearGradient(
                  colors: [
                    mainBlackGenerator(0.7),
                    mainBlackGenerator(0.5),
                    secondGreenGenerator(0.4),
                    mainGreenGenerator(0.4),
                    secondGreenGenerator(0.4),
                    mainBlackGenerator(0.5),
                    mainBlackGenerator(0.7)
                  ],
              ),
            ),
            child: Row(
              children: [
                for(var item in popularWorkouts)
                  item,
              ],
            ),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Recommended",
            style: TextStyle(
              color: mainWhiteGenerator(1),
              fontSize: 25,

            ),
          ),
        ),
        for(int i=0; i<10; i++)
          ListedItemFrame(),

        SizedBox(height: 75,),
      ],
    );
  }
}