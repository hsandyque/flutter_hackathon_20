import 'mission_data.dart';

class UserData {
  String userName;
  String email;
  String password;
  double eCash;

  List<MissionData> acceptedMission;

  UserData({
    this.userName,
    this.email,
    this.password,
    this.eCash,
    this.acceptedMission = const [],
  });
}
