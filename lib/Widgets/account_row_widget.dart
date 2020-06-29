import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mission_hunter/components/flicker_text.dart';
import 'package:mission_hunter/config/colors.dart';

class AccountPageRowWidget extends StatelessWidget {
  final IconData rowIcon;
  final String rowInfo;

  AccountPageRowWidget({this.rowIcon, this.rowInfo});
  Color primary = AppColors.neonNew;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(
              rowIcon,
              size: 40,
            ),
          ),
          Expanded(
            flex: 5,
            child: FlickerText(
              color: primary,
              text: rowInfo,
              shouldFlicker: Random().nextBool(),
            ),

            // Text(
            //   rowInfo,
            //   style: TextStyle(fontSize: 30),
            // ),
          ),
        ],
      ),
    );
  }
}
