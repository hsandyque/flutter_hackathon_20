import 'package:flutter/material.dart';
import 'package:mission_hunter/Widgets/mission_list_widget.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MissionListWidget(),
      ),
    );
  }
}
