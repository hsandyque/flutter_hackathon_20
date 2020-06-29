import "package:flutter/material.dart";
import 'package:mission_hunter/DataModels/mission_data.dart';
import 'mission_map.dart';

class MissionAcceptScreen extends StatelessWidget {
  final MissionData missionDetail;
  final Function statusUpdateCallBack;

  MissionAcceptScreen(this.missionDetail, this.statusUpdateCallBack);

  @override
  Widget build(BuildContext context) {
    // Fail to create ListTile dynamically
    // final List<ListTile> _tileForDetail = [];
    // missionDetail.toJson().forEach((key, value) {
    //   _tileForDetail.add(
    //     ListTile(
    //       leading: Text(key),
    //       trailing: Text(value),
    //     ),
    //   );
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission Detail"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                child: MissionMap(),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    leading: Text('Mission Title:'),
                    trailing: Text(missionDetail.missionName),
                  ),
                  ListTile(
                    leading: Text('Dead Line:'),
                    trailing: Text(missionDetail.missionEndTime.toString()),
                  ),
                  ListTile(
                    leading: Text('Rewards:'),
                    trailing: Text(
                        "\$${missionDetail.missionReward.toStringAsFixed(2)}"),
                  ),
                  ListTile(
                    leading: Text('Dead Line:'),
                    trailing: Text(missionDetail.missionEndTime.toString()),
                  ),
                  ListTile(
                    leading: Text('Mission Type:'),
                    trailing: Text(missionDetail.missionType.toString()),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Mission Detail:'),
                      Text(missionDetail.missionDescription),
                    ],
                  ),
                  RaisedButton(
                    child: Text('Accept'),
                    onPressed: () {
                      statusUpdateCallBack();
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
