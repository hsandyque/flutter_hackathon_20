import 'mission_data.dart';
import 'package:flutter/foundation.dart';

class MissionArray extends ChangeNotifier {
  List<MissionData> dummyList = [
    MissionData(
      missionID: "00001",
      missionName: "Get watch back",
      missionCreator: "Coco",
      missionEndTime: DateTime(2020, 7, 4),
      missionLocation:
          "49 Sec 1 Zhongxiao W Rd, Zhongzheng District, Taipei, Taiwan",
      missionReward: 100,
      missionStatus: MissionStatus.open,
      missionType: MissionType.steal,
      missionDescription:
          "My brother stole my watch",
    ),
    MissionData(
      missionID: "00002",
      missionName: "Search my kitty",
      missionCreator: "Charlotte",
      missionEndTime: DateTime(2020, 7, 1),
      missionLocation: "1 Matheson St, Causeway Bay, Hong Kong",
      missionReward: 1000,
      missionStatus: MissionStatus.open,
      missionType: MissionType.search,
      missionDescription: "I lost my kitty, Please help me find it.",
    )
  ];

  void addItem({MissionData newMission}) {
    dummyList.add(newMission);
    notifyListeners();
  }

  void updateStatus(int index, MissionStatus newStatus) {
    dummyList[index].missionStatus = newStatus;
    notifyListeners();
  }
}
