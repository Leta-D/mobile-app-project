import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitlife/pages/workout_showing_page.dart';

class ListedItemFrame extends StatefulWidget{
  const ListedItemFrame({super.key});

  @override
  createState() => _ListedItemFrameSate();
}
class _ListedItemFrameSate extends State<ListedItemFrame>{
  final imgUrl = "assets/images/upperWorkout.jpg";
  final name = "Push Up";
  final target = "target upper and lower chest";
  final steps = ["Pull and I was born in lLajs ajhhzkjhu ajhd",
    "Pull and I was born in lLajs ajhhzkjhu ajhd",
    "Pull and I was born in lLajs ajhhzkjhu ajhd"];

  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: mainBlackGenerator(0.6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: mainGreenGenerator(0.5),
        ),
      ),
      // color: mainBlackGenerator(0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 90,
                child: ClipRect(
                    child: Image.asset(imgUrl)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                        color: mainWhiteGenerator(1),
                        fontSize: 16,
                      ),
                    ),
                    Text(target,
                      style: TextStyle(
                        color: mainWhiteGenerator(0.6),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(onPressed: (){
            setState(() {
              _isFavorite = !_isFavorite;
            });
          }, icon: (_isFavorite)?
          Icon(CupertinoIcons.heart_fill) :
          Icon(CupertinoIcons.heart),
            color: mainGreenGenerator(1),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=>WorkoutShowingPage(steps: steps, imgUrl: imgUrl, name: name))
            );
          },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(secondGreenGenerator(1)),
            ), child: Icon(CupertinoIcons.arrow_right,
              color: mainBlackGenerator(1),
            ),

          ),
        ],
      ),
    );
  }
}