import 'package:flutter/material.dart';
import 'package:mission_hunter/DataModels/mission_data.dart';
import 'package:mission_hunter/screens/mission_accept_screen.dart';
import 'package:provider/provider.dart';

import 'mission_tile_widget.dart';
import 'package:mission_hunter/DataModels/mission_array.dart';

class MissionListWidget extends StatelessWidget {
  void statusUpdateCallBack() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<MissionArray>(
      builder: (context, missionDummyData, child) {
        return ListView.builder(
          itemCount: missionDummyData.dummyList.length,
          itemBuilder: (context, index) {
            return (missionDummyData.dummyList[index].missionStatus ==
                    MissionStatus.open)
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: MissionTileWidget(
                      mission: missionDummyData.dummyList[index],
                      //some simple screen to accept mission
                      missionDetailCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MissionAcceptScreen(
                              missionDummyData.dummyList[index],
                              () {
                                context.read<MissionArray>().updateStatus(
                                    index, MissionStatus.accepted);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : null;
          },
        );
      },
    );
  }
}
