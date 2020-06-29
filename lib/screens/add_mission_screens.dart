import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mission_hunter/DataModels/mission_array.dart';
import '../DataModels/mission_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:mission_hunter/config/colors.dart';

class AddMissionScreen extends StatefulWidget {
  static const screenID = "addMissionScreenID";

  @override
  _AddMissionScreenState createState() => _AddMissionScreenState();
}

class _AddMissionScreenState extends State<AddMissionScreen> {
  final _missionTitleController = TextEditingController();
  final _missionLocationController = TextEditingController();
  final _missionDateController = TextEditingController();
  DateTime _missionEndDate;
  final _missionRewardController = TextEditingController();
  final _missionDescriptionController = TextEditingController();
  MissionType _selectedMissionType;
  final double _sizedBoxSpace = 5;

  void _submitData(BuildContext context) {
    //pass data to another class to handle sending data to Firebase
    MissionData newMissionToAdd = MissionData(
      missionCreator: "me",
      missionID: "${Random()}",
      missionName: _missionTitleController.text,
      missionLocation: _missionLocationController.text,
      missionEndTime: _missionEndDate,
      missionDescription: _missionDescriptionController.text,
      missionReward: double.parse(_missionRewardController.text),
      missionStatus: MissionStatus.open,
      missionType: _selectedMissionType,
    );
    context.read<MissionArray>().addItem(newMission: newMissionToAdd);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        title: Text('Add Mission'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Mission Title'),
                  controller: _missionTitleController,
                ),
                SizedBox(height: _sizedBoxSpace),
                TextField(
                  decoration: InputDecoration(labelText: 'Mission Location'),
                  controller: _missionLocationController,
                ),
                SizedBox(height: _sizedBoxSpace),
                TextField(
                  decoration: InputDecoration(labelText: 'Mission Date'),
                  readOnly: true,
                  onTap: () async {
                    var datePicked = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2046),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );
                    setState(() {
                      _missionDateController.text = datePicked.toString();
                      _missionEndDate = datePicked;
                    });
                  },
                  controller: _missionDateController,
                ),
                SizedBox(height: _sizedBoxSpace),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Mission Type:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      DropdownButton<MissionType>(
                        value: _selectedMissionType,
                        onChanged: (MissionType newValue) {
                          setState(() => _selectedMissionType = newValue);
                        },
                        items: MissionType.values.map((e) {
                          return DropdownMenuItem<MissionType>(
                            value: e,
                            child: Text(e.toString().split(".")[1]),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _sizedBoxSpace),
                TextField(
                  decoration: InputDecoration(labelText: 'Rewards'),
                  controller: _missionRewardController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: _sizedBoxSpace),
                TextField(
                  decoration: InputDecoration(labelText: 'Mission Description'),
                  controller: _missionDescriptionController,
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text('ADD'),
                  onPressed: () {
                    _submitData(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
