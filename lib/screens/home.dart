import 'package:flutter/material.dart';
import 'package:mission_hunter/components/flicker_circle.dart';
import 'package:mission_hunter/components/flicker_line.dart';
import 'package:mission_hunter/components/flicker_text.dart';
import 'package:mission_hunter/components/single_flicker_text.dart';
import 'package:mission_hunter/config/colors.dart';

class Home extends StatelessWidget {
  Color primary = AppColors.neonNew;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: ListView(
        children: [
          Padding(padding: const EdgeInsets.all(10)),
          SingleFlickerText(color: primary),
          Padding(padding: const EdgeInsets.all(5)),
          FlickerLine(color: primary),
          Padding(padding: const EdgeInsets.all(100)),
          FlickerCircle(
            color: primary,
            radius: 80,
            shouldFlicker: false,
            shadowSpread: 5,
            strokeWidth: 3,
            spreadValue: 5,
            child: FlickerText(
              color: primary,
              text: "HOME",
              shouldFlicker: true,
            ),
          ),
        ],
      ),
    );
  }
}
