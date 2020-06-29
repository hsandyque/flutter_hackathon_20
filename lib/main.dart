import 'package:flutter/material.dart';
import 'screens/tab_screen.dart';
import 'screens/add_mission_screens.dart';
import 'package:provider/provider.dart';
import 'DataModels/mission_array.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MissionArray>(
      create: (context) => MissionArray(),
      child: MaterialApp(
        title: 'Mission Hunter',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.purple,
        ),
        //home: TabScreen(),
        routes: {
          '/': (context) => TabScreen(),
          AddMissionScreen.screenID: (context) => AddMissionScreen()
        },
      ),
    );
  }
}
