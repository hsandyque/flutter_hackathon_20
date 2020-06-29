//import 'package:geolocator/geolocator.dart';

class MissionData {
  //using string for the moment, maybe switch back to int later
  String missionID;
  String missionName;
  //dummy gonna use some magic string
  //Position missionLocation;
  String missionLocation;
  String missionDescription;
  DateTime missionEndTime;
  double missionReward;
  MissionStatus missionStatus;
  MissionType missionType;
  String missionCreator;

  MissionData({
    this.missionID,
    this.missionName,
    this.missionLocation,
    this.missionDescription,
    this.missionEndTime,
    this.missionReward,
    this.missionStatus,
    this.missionCreator,
    this.missionType,
  });

  MissionData.fromJson(Map<dynamic, dynamic> json)
      : missionID = json['Mission ID'],
        missionName = json['Mission Name'],
        missionCreator = json['Mission Creator'],
        missionLocation = json['Mission Location'],
        missionDescription = json['Mission Description'],
        missionEndTime = json['Mission EndTime'],
        missionReward = json['Mission Reward'],
        missionStatus = json['Mission Status'];

  Map<dynamic, dynamic> toJson() => {
        'Mission ID': missionID,
        'Mission Name': missionName,
        'Mission Creator': missionCreator,
        'Mission Location': missionLocation,
        'Mission Description': missionDescription,
        'Mission EndTime': missionEndTime,
        'Mission Reward': missionReward,
        'Mission Status': missionStatus,
      };
}

enum MissionStatus { open, accepted, failed, completed, outdated }
enum MissionType { steal, destroy, assassination, protect, transport, search }
