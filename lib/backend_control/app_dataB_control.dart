import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/event_showing_window.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> userProfileInfo = {
  "userName": "",
  "weight": 70,
  "height": 120,
  "age": -1,
  "gender": "male"
};

// for home page popular workouts section showing
final popularWorkouts = [
  eventShowingWindow("assets/images/upperWorkout.jpg",300, 250, ["Upper Body","Training"]),
  eventShowingWindow("assets/images/backWorkout.jpg",300, 250,["Back Body", "Training"]),
  eventShowingWindow("assets/images/man_with_dumbel.jpg",300, 250,["Lower Body", "Training"]),
  eventShowingWindow("assets/images/fullWorkout.jpg",300, 250,["Full Body", "Training"]),
];

// filter option in discovery-page floating nav
final category = {
  "Body": CupertinoIcons.hammer_fill,
  "Muscle": CupertinoIcons.hammer_fill,
      "Equipment": CupertinoIcons.hammer_fill,
};

// filter options for search case (used in discovery page)
final itemONCategory = [
  // body parts
  [
    "chest", "back", "shoulders", "upper arms", "lower arms", "neck",
    "upper legs", "lower legs", "waist"
  ],
  // targets
  [
    "abductors", "abdominals", "adductors", "biceps", "calves", "chest",
    "forearms", "glutes", "hamstrings", "lats", "lower back", "middle back",
    "upper back", "neck", "quadriceps", "traps", "triceps"
  ],
  // equipments
  [
    "barbell", "bodyweight", "cable", "dumbbell", "kettlebell", "machine",
    "medicine ball", "resistance band", "smith machine", "suspension trainer",
    "trainer"
  ],
];
Future<void> storeToPreferences(Map<String, dynamic> mapData) async {
  final prefer = await SharedPreferences.getInstance();
  mapData.forEach((key, value){
    switch(value.runtimeType){
      case String:{
        prefer.setString(key, value);
        break;
      }
      case int:{
        prefer.setInt(key, value);
        break;
      }
      case double:{
        prefer.setDouble(key, value);
        break;
      }
      case bool:{
        prefer.setBool(key, value);
        break;
      }
      case const (List<String>):{
        prefer.setStringList(key, value);
        break;
      }
    }
  });
  prefer.setBool("isNewUser", false);
}

Future<dynamic> getToPreferences(String key) async {
  final prefer = await SharedPreferences.getInstance();
  print(prefer.get("isNewUser"));
  return prefer.getBool("isNewUser");
}


