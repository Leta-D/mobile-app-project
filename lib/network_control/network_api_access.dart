import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:fitlife/network_control/exercise_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// import '';

// curl --request GET \
// --url https://exercisedb.p.rapidapi.com/ \  (*base)
// --header 'x-rapidapi-host: exercisedb.p.rapidapi.com' \
// --header 'x-rapidapi-key: f74f944cbemsh8f86e257aa6c926p1b4170jsn9608b4a890d6'

// =====================query to limit data of api=============================
// Limit: Defines how many exercises you want to return.
// Offset: Defines where the data should start (useful for pagination)
/*
*this api returns data from DB in a sequence starting from 0 (initial)
* so we use offset to tell where it should start which is use full to get
* different results when user refresh our app.
*/

BaseOptions _options = BaseOptions(
  baseUrl: "https://exercisedb.p.rapidapi.com/",
  headers: {
    'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
    'x-rapidapi-key': 'f74f944cbemsh8f86e257aa6c926p1b4170jsn9608b4a890d6'
  },
);
Dio _dio = Dio(_options);


Future<List<ExerciseObject>> fetchData(BuildContext context) async{
  final appProvider = Provider.of<AppStateControl>(context);
  String url = (appProvider.specifier.isEmpty)? "/exercises" :
  "/exercises/${appProvider.discoveryOption[appProvider.currentDiscoverNavIndex]}//${appProvider.specifier}";
  _dio.options.queryParameters = {
    'limit' : 10,
    'offset' : appProvider.offset,
  };
  List<ExerciseObject> exerciseObjects = [];
  try {
    Response response = await _dio.get(url);
    if(response.statusCode == 200){
      for(var json in response.data) {
        exerciseObjects.add(ExerciseObject.fromJson(json));
        print(json);
      }
      print("done");
      return exerciseObjects;

    }
    else{
      throw("Error can't load [status code problem]");
    }
  }catch (e){
    throw("Error can't load [unknown connection error]");
  }
}


