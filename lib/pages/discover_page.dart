import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:fitlife/backend_control/app_dataB_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/discover_floating_nav.dart';
import '../widgets/listed_discover_frame.dart';
import '../widgets/listed_item_frame.dart';
import 'package:fitlife/network_control/network_api_access.dart';

import '../widgets/search_with_dropdown.dart';


class DiscoverPage extends StatelessWidget{
  const DiscoverPage({super.key});

  final int offset = 0;
  @override
  Widget build(BuildContext context) {
    // final appProvider = Provider.of<AppStateControl>(context);
    Size screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              // gap b/n top of screen and search
              SizedBox(height: screenSize.height/4.7,),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        print("Refresh");
                      },
                      icon: Row(
                        children: [
                          Icon(CupertinoIcons.refresh_circled_solid,
                            color: mainGreenGenerator(1),
                          ),
                          Text("Refresh",
                            style: TextStyle(
                              color: mainWhiteGenerator(1),
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                    // from widget for search and dropdown handler
                    searchWithDropdown(context,itemONCategory),
                  ]
                ),
              ),
              FutureBuilder(
                future: fetchData(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: screenSize.height - screenSize.height/2.2,
                          child: ListView(
                              children: [
                                for(var exerciseObject in snapshot.data)
                                  ListedDiscoverFrame(exerciseObject: exerciseObject,),

                                SizedBox(height: 30,),
                              ],
                          ),
                        );
                      }
                    else if(snapshot.hasError){
                      return SingleChildScrollView(
                        child: Stack(
                          children: [
                            //takeMeHome.gif
                            Opacity(opacity: 0.7,
                              child: Image.asset("assets/images/error_gif/takeMeHome.gif",
                                width: screenSize.width,
                                // for why
                                // height: screenSize.height/1.8,
                              fit: BoxFit.cover,),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Text(" Connection Error\n "
                                  "Check your internet connection"
                                  "\n ${snapshot.error}",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    else{
                      return Opacity(opacity: 0.7,
                        child: Image.asset("assets/images/error_gif/takeMeHome.gif",
                          width: screenSize.width,
                          fit: BoxFit.cover,),
                      );
                    }
                  }
                  else if(snapshot.connectionState == ConnectionState.waiting){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: CircularProgressIndicator(
                        color: mainGreenGenerator(1),
                        backgroundColor: secondGreenGenerator(0.5),
                      )
                    );
                  }
                  else{
                    return Opacity(opacity: 0.7,
                      child: Image.asset("assets/images/error_gif/takeMeHome.gif",
                        width: screenSize.width,
                        fit: BoxFit.cover,),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        
        Container(
          height: screenSize.height/6,
          width: screenSize.width,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            color: mainWhiteGenerator(0.2),

          ),
          // category --from app DB control
          child: discoverFloatingNav(category, context),
        ),
      ],
    );
  }
}


// =========== REMARK ===============
// problem internet connection is always needed
// solution-1 use pre-fetching and store it in list
//      so that internet is needed only w/n refreshing
// solution-2 use conditional to check list and if null perform future
//    else load from list [use provider to control state of list (null | filled)]
void loadData(BuildContext context){
  FutureBuilder(
    future: fetchData(context),
    builder: (context, AsyncSnapshot snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        if (snapshot.hasData) {

          return ListView(
            children: [
              for(var exerciseObject in snapshot.data)
                ListedDiscoverFrame(exerciseObject: exerciseObject,),

              SizedBox(height: 30,),
            ],
          );
        }
        else if(snapshot.hasError){
          return Column(
            children: [
              //takeMeHome.gif
              Image.asset("assets/images/error_gif/why.gif"),
              Text("Error${snapshot.error}", style: TextStyle(color: Colors.red),)
            ],
          );
        }
        else{
          return Text("Refresh", style: TextStyle(color: Colors.white),);
        }
      }
      else if(snapshot.connectionState == ConnectionState.waiting){
        return LinearProgressIndicator();
      }
      else{
        return Text("Refresh", style: TextStyle(color: Colors.white),);
      }
    },
  );
}