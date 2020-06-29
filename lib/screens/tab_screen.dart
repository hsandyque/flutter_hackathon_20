import 'package:flutter/material.dart';
import 'package:mission_hunter/config/colors.dart';
import 'package:mission_hunter/screens/home.dart';
import 'search.dart';
import 'mission_map.dart';
import 'account.dart';
import 'add_mission_screens.dart';
import 'package:mission_hunter/DataModels/user_data.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [Home(), Search(), MissionMap(), Account(user)];
  int _selectedPageIndex = 0;
  static UserData user = UserData(
      userName: 'Me', email: 'me@cyber.com', password: 'password', eCash: 5000);

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {String title, IconData icon}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
      backgroundColor: AppColors.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        title: Text('Mission Hunter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddMissionScreen.screenID);
        },
        child: Icon(Icons.add),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.dark,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          onTap: (value) {
            setState(() {
              _selectedPageIndex = value;
            });
          },
          items: [
            buildBottomNavigationBarItem(title: 'Home', icon: Icons.home),
            buildBottomNavigationBarItem(title: 'Search', icon: Icons.search),
            buildBottomNavigationBarItem(title: 'Map', icon: Icons.location_on),
            buildBottomNavigationBarItem(
                title: 'Account', icon: Icons.account_circle),
          ]),
    );
  }
}
