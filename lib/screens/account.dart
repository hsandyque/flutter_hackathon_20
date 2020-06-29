import 'package:flutter/material.dart';
import 'package:mission_hunter/DataModels/user_data.dart';
import 'package:mission_hunter/Widgets/account_row_widget.dart';

class Account extends StatelessWidget {
  final UserData user;

  Account(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            AccountPageRowWidget(
              rowIcon: Icons.account_box,
              rowInfo: user.userName,
            ),
            AccountPageRowWidget(
              rowIcon: Icons.lock,
              rowInfo: '********',
            ),
            AccountPageRowWidget(
              rowIcon: Icons.mail,
              rowInfo: user.email,
            ),
            AccountPageRowWidget(
              rowIcon: Icons.history,
              rowInfo: 'History',
            ),
            AccountPageRowWidget(
              rowIcon: Icons.favorite,
              rowInfo: 'Favorite',
            ),
            AccountPageRowWidget(
              rowIcon: Icons.attach_money,
              rowInfo: user.eCash.toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}
