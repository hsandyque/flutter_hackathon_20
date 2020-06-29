import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mission_hunter/DataModels/mission_data.dart';
import 'package:mission_hunter/config/colors.dart';

class MissionTileWidget extends StatelessWidget {
  final MissionData mission;
  final Function missionDetailCallback;

  MissionTileWidget({this.mission, this.missionDetailCallback});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   leading: FlutterLogo(),
    //   title: Text(missionTitle),
    //   trailing: Icon(Icons.more_vert),
    //   onTap: missionDetailCallback,
    //    );
    return InkWell(
      onTap: missionDetailCallback,
      child: Container(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 75,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        color: Colors.deepPurple,
                        child: Text(
                          DateFormat.MMM().format(mission.missionEndTime),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            DateFormat.d().format(mission.missionEndTime),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mission.missionName,
                        style: TextStyle(
                          color: AppColors.neonNew,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        mission.missionDescription,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    '\$${mission.missionReward.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: AppColors.neonPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
